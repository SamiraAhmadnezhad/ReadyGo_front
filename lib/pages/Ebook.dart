import 'package:flutter/material.dart';
import 'package:readygo/Book.dart';
import 'package:readygo/BookView.dart';
import 'package:readygo/Comment.dart';
import 'package:readygo/Genre.dart';
import 'package:readygo/User.dart';
import 'package:readygo/pages/BookInformation.dart';
import 'package:readygo/pages/getListBook.dart';
class Ebook extends StatefulWidget {
  Ebook({super.key,required this.user});
  User user;
  @override
  State<Ebook> createState() => _EbookState(user: user);
}

class _EbookState extends State<Ebook> {
  _EbookState ({required this.user});
  @override
  void initState() {
    super.initState();
  }
  User user;

  List<Book> newBook (List<Book> books){
    List<Book> result=[];
    for (Book b in books){
      if (b.isNew==true){
        result.add(b);
      }
    }
    return result;
  }
  List<Book> TopSellingBook (List<Book> books){
    List<Book> result=[];
    for (Book b in books){
      if (b.sellNum>10){ // num of the best sell can change
        result.add(b);
      }
    }
    return result;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  const Text("Recent Book",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),),
                  SizedBox(height: 10,),
                  Container(
                    height: MediaQuery.of(context).size.height / 2-220,
                    //color: Colors.blue,
                    child: user.recentBooks!=null
                    ? ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: user.recentBooks!.length,
                      itemBuilder: (context,index){
                        final Book=user.recentBooks![index];
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
                        'No books are currently being read.',
                        style: TextStyle(
                        color: Colors.black,
                          fontSize: 20
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),


            Container(
              color: Colors.pink.shade50,
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  const Text("Favorite Book",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),),
                  SizedBox(height: 10,),
                  Container(
                    //color: Colors.pink.shade50,
                    height: MediaQuery.of(context).size.height / 2-220,
                    child: user.favoriteBooks!=null
                        ? ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: user.favoriteBooks!.length,
                      itemBuilder: (context,index){
                        final Book=user.favoriteBooks![index];
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


            Container(
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  const Text("New Book",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),),
                  SizedBox(height: 10,),
                  Container(
                    height: MediaQuery.of(context).size.height / 2-220,
                    child: newBook(getListBook.books).isNotEmpty
                        ? ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: newBook(getListBook.books).length,
                      itemBuilder: (context,index){
                        final Book= newBook(getListBook.books)[index];
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
                        'There are no new books.',
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


            Container(
              //height: 200,
              color: Colors.pink.shade50,
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  const Text("Top Selling Book",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),),
                  SizedBox(height: 10,),
                  Container(
                    height: MediaQuery.of(context).size.height / 2-220,
                    child: TopSellingBook(getListBook.books).isNotEmpty
                        ? ListView.builder(
                      addAutomaticKeepAlives: true,
                      //padding:const EdgeInsets.all(8.0),
                      scrollDirection: Axis.horizontal,
                      itemCount: TopSellingBook(getListBook.books).length,
                      itemBuilder: (context,index){
                        final Book=TopSellingBook(getListBook.books)[index];
                        return BookView(
                          book : Book,
                          onTap : (){
                            setState(() {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => BookInformation(user: user, book: Book,)
                                ),
                              );
                            });
                          },
                        );
                      },
                    )
                        : const Center(
                      child: Text(
                        'There are no bestselling books available.',
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