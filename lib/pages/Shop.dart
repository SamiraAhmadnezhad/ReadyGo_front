import 'package:flutter/material.dart';
import 'package:readygo/Book.dart';
import 'package:readygo/BookView1.dart';
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
  String dropdownvalue = 'No selected';
  var items = [
    'No selected',
    'most expensive',
    'cheapest',
    'most liked',
  ];
  List <Book> shopBook=getListBook.books;
  List <Book> sortShopBook (String dropdownvalue){
    switch (dropdownvalue){
      case 'No selected':{
        break;
      }
      case 'most expensive':{
        shopBook.sort((a, b) => b.price.compareTo(a.price));
        break;
      }
      case 'cheapest':{
        shopBook.sort((a, b) => a.price.compareTo(b.price));
        break;
      }
      case 'most liked':{
        shopBook.sort((a, b) => b.rate.compareTo(a.rate));
        break;
      }
    }
    return shopBook;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade300,
          title: TextFormField(
            decoration: const InputDecoration(
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    Text("sort by :",
                    style: TextStyle(
                      fontSize: 17,
                    ),),
                    SizedBox(width: 10,),
                    DropdownButton(
                      value: dropdownvalue,
                      icon: const Icon(Icons.format_list_numbered_rtl ),
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },

                    ),
                  ],
                ),
              ),
              //SizedBox(height: 10,),
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
                      height: 35,
                      child: Row(
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(Icons.all_inclusive),
                          SizedBox(width: 10,),
                          Text(
                            "All",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              //fontSize: 20,
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
                      height: 35,
                      child: Row(
                        children: const [
                          Icon(Icons.theater_comedy),
                          SizedBox(width: 10,),
                          Text(
                            "Criminal",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              //fontSize: 20,
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
                      height: 35,
                      child: Row(
                        children: const [
                          Icon(Icons.videogame_asset),
                          SizedBox(width: 10,),
                          Text(
                            "Fantasy",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              //fontSize: 20,
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
                      height: 35,
                      child: Row(
                        children: const [
                          Icon(Icons.science_outlined),
                          SizedBox(width: 10,),
                          Text(
                            "Academic",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              //fontSize: 20,
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
                      height: 35,
                      child: Row(
                        children: const [
                          Icon(Icons.favorite),
                          SizedBox(width: 10,),
                          Text(
                            "Romantic",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              //fontSize: 20,
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
                      height: 35,
                      child: Row(
                        children: const [
                          Icon(Icons.mood_bad),
                          SizedBox(width: 10,),
                          Text(
                            "Scary",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              //fontSize: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height:5 ,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  color: Colors.black,
                  height: 1,
                ),
              ),
              const SizedBox(height:5 ,),
              Container(
                //color: Colors.pink.shade50,
                height: MediaQuery.of(context).size.height / 2-80,
                child: sortShopBook(dropdownvalue)!=null
                    ? ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: sortShopBook(dropdownvalue)!.length,
                  itemBuilder: (context,index){
                    final Book=sortShopBook(dropdownvalue)![index];
                    return BookView1(
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