import 'package:flutter/material.dart';
import 'package:readygo/Book.dart';
import 'package:readygo/BookView.dart';
import 'package:readygo/Genre.dart';
import 'package:readygo/User.dart';

class Ebook extends StatefulWidget {
  Ebook({super.key,required this.user});
  User user;
  @override
  State<Ebook> createState() => _EbookState(user: user);
}

class _EbookState extends State<Ebook> {
  _EbookState ({required this.user});
  User user;
  List<Book> books=[
    Book(png: "assets/images/hary1.jpg",
        name: "hary2", auther: "samira",
        genre: Genre.Criminal,
        isFree: true,
        isAvailable: true,
        price: 0,
        special: false,
        year: 1383,
        sellNum: 20,
        isNew: true,
    ),
    Book(png: "assets/images/hary2.jpg",
      name: "hary2", auther: "samira",
      genre: Genre.Criminal,
      isFree: true,
      isAvailable: true,
      price: 0,
      special: false,
      year: 1383,
      sellNum: 20,
      isNew: true,
    ),
    Book(png: "assets/images/hary3.jpg",
      name: "hary3", auther: "samira",
      genre: Genre.Criminal,
      isFree: true,
      isAvailable: true,
      price: 0,
      special: false,
      year: 1383,
      sellNum: 20,
      isNew: true,
    ),
    Book(png: "assets/images/hary4.jpg",
      name: "hary4", auther: "samira",
      genre: Genre.Criminal,
      isFree: true,
      isAvailable: true,
      price: 0,
      special: false,
      year: 1383,
      sellNum: 20,
      isNew: true,
    ),
  ];
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
                    height: MediaQuery.of(context).size.height / 2-150,
                    //color: Colors.blue,
                    child: user.recentBooks.isNotEmpty
                    ? ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: user.recentBooks.length,
                      itemBuilder: (context,index){
                        final Book=user.recentBooks[index];
                        return BookView(
                          book : Book,
                          onTap : (){
                            print("jjj");
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
                    height: MediaQuery.of(context).size.height / 2-150,
                    child: user.favoriteBooks.isNotEmpty
                        ? ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: user.favoriteBooks.length,
                      itemBuilder: (context,index){
                        final Book=user.favoriteBooks[index];
                        return BookView(
                          book : Book,
                          onTap : (){
                            print("jjj");
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
                    height: MediaQuery.of(context).size.height / 2-150,
                    child: newBook(books).isNotEmpty
                        ? ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: newBook(books).length,
                      itemBuilder: (context,index){
                        final Book= newBook(books)[index];
                        return BookView(
                          book : Book,
                          onTap : (){
                            print("jjj");
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
                    height: MediaQuery.of(context).size.height / 2-150,
                    child: TopSellingBook(books).isNotEmpty
                        ? ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: TopSellingBook(books).length,
                      itemBuilder: (context,index){
                        final Book=TopSellingBook(books)[index];
                        return BookView(
                          book : Book,
                          onTap : (){
                            print("jjj");
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