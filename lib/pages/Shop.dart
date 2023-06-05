import 'package:flutter/material.dart';
import 'package:readygo/Book.dart';
import 'package:readygo/BookView.dart';
import 'package:readygo/Genre.dart';
import 'package:readygo/User.dart';
import 'package:readygo/pages/BookInformation.dart';
import 'package:readygo/pages/Search.dart';
import 'package:readygo/pages/getListBook.dart';
class Shop extends StatefulWidget {
  const Shop({super.key,required this.user});
  final User user;
  @override
  State<Shop> createState() => _ShopState(user: user);
}

class _ShopState extends State<Shop> {
  _ShopState({required this.user});
  User user;
  String search='';
  void initState() {
    super.initState();
  }
  String dropdownvalue = 'Item 1';
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  List <Book> shopBook=getListBook.books;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        title: TextFormField(
          decoration: const InputDecoration(
            // icon: Align(
            //   child: Icon(Icons.abc,
            //     color: Colors.black,
            //     size: 40,),
            // ),
            //labelText: 'email*',
            hintText: 'What are you looking for?',
          ),
          onChanged: (String search){
            setState(() {
              this.search=search.toLowerCase();
            });
          },
        ),
        leading: IconButton(
          icon: Icon(Icons.search,
            color: Colors.black,),
          onPressed: (){
            if (search!='') {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => Search(user: user, search: search)),
                );
              }
            },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10,),
            DropdownButton(
              value: dropdownvalue,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },

            ),
            SizedBox(height: 10,),
            ButtonBar(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width/3,
                  child: MaterialButton(
                    minWidth: double.infinity,
                    onPressed: (){
                      setState(() {
                        shopBook=getListBook.books;
                      });
                    },
                    color: Colors.pink.shade400,
                    height: 40,
                    child: Row(
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(Icons.all_inclusive),
                        SizedBox(width: 10,),
                        Text(
                          "All",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 20,),
                Container(
                  width: MediaQuery.of(context).size.width/3,
                  child: MaterialButton(
                    onPressed: (){
                      setState(() {
                        List<Book> x=[];
                        for (Book b in getListBook.books){
                          if (b.genre==Genre.Criminal)
                            x.add(b);
                        }
                        shopBook=x;
                      });
                    },
                    color: Colors.pink.shade400,
                    height: 40,
                    child: Row(
                      children: const [
                        Icon(Icons.theater_comedy),
                        SizedBox(width: 10,),
                        Text(
                          "Criminal",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            ButtonBar(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width/3,
                  child: MaterialButton(
                    onPressed: (){
                      setState(() {
                        List<Book> x=[];
                        for (Book b in getListBook.books){
                          if (b.genre==Genre.Fantasy)
                            x.add(b);
                        }
                        shopBook=x;
                      });
                    },
                    color: Colors.pink.shade400,
                    height: 40,
                    child: Row(
                      children: const [
                        Icon(Icons.videogame_asset),
                        SizedBox(width: 10,),
                        Text(
                          "Fantasy",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 20,),
                Container(
                  width: MediaQuery.of(context).size.width/3,
                  child: MaterialButton(
                    onPressed: (){
                      setState(() {
                        List<Book> x=[];
                        for (Book b in getListBook.books){
                          if (b.genre==Genre.Academic)
                            x.add(b);
                        }
                        shopBook=x;
                      });
                    },
                    color: Colors.pink.shade400,
                    height: 40,
                    child: Row(
                      children: const [
                        Icon(Icons.science_outlined),
                        SizedBox(width: 10,),
                        Text(
                          "Academic",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            ButtonBar(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width/3,
                  child: MaterialButton(
                    onPressed: (){
                      setState(() {
                        List<Book> x=[];
                        for (Book b in getListBook.books){
                          if (b.genre==Genre.Romantic)
                            x.add(b);
                        }
                        shopBook=x;
                      });
                    },
                    color: Colors.pink.shade400,
                    height: 40,
                    child: Row(
                      children: const [
                        Icon(Icons.favorite),
                        SizedBox(width: 10,),
                        Text(
                          "Romantic",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 20,),
                Container(
                  width: MediaQuery.of(context).size.width/3,
                  child: MaterialButton(
                    onPressed: (){
                      setState(() {
                        List<Book> x=[];
                        for (Book b in getListBook.books){
                          if (b.genre==Genre.Scary)
                            x.add(b);
                        }
                        shopBook=x;
                      });
                    },
                    color: Colors.pink.shade400,
                    height: 40,
                    child: Row(
                      children: const [
                        Icon(Icons.mood_bad),
                        SizedBox(width: 10,),
                        Text(
                          "Scary",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height:30 ,),
            Container(
              //color: Colors.pink.shade50,
              height: MediaQuery.of(context).size.height / 2-220,
              child: shopBook!=null
                  ? ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: shopBook!.length,
                itemBuilder: (context,index){
                  final Book=shopBook![index];
                  return BookView(
                    book : Book,
                    onTap : (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => BookInformation(user: user, book: Book,)
                        ),
                      );
                    },
                  );
                },
              )
                  : const Center(
                child: Text(
                  'There are no books',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}