import 'package:flutter/material.dart';
import 'package:readygo/BookView.dart';
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
              this.search=search;
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




            Container(
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Container(
                    //color: Colors.pink.shade50,
                    height: MediaQuery.of(context).size.height / 2-220,
                    child: getListBook.books!=null
                        ? ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: getListBook.books!.length,
                      itemBuilder: (context,index){
                        final Book=getListBook.books![index];
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
                        'There are no books in favorites.',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}