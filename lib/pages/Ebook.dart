import 'package:flutter/material.dart';
import 'package:readygo/Book.dart';
import 'package:readygo/BookView.dart';
import 'package:readygo/Genre.dart';

class Ebook extends StatefulWidget {
  const Ebook({super.key});

  @override
  State<Ebook> createState() => _EbookState();
}

class _EbookState extends State<Ebook> {
  List <Book> books= [];//[new Book(png: "assets/images/hary1.jpg", name: "hary", auther: "samira", genre: Genre.Criminal, isFree: true, isAvailable: true, price: 0, special: false, year: 1383, sellNum: 4, isNew: true,isFavorite: true,isRecent: true)];
  List<Book> recentBooks(List<Book> books){
    List<Book> result=[];
    for (Book b in books){
      if (b.isRecent==true) {
        result.add(b);
      }
    }
    return result;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: recentBooks(this.books).isNotEmpty
      ? ListView.builder(
        itemCount: recentBooks(this.books).length,
        itemBuilder: (context,index){
          final Book=recentBooks(this.books)[index];
          return BookView(
            book : Book,
            onTap : (){
              print("object");
            },
          );
        },
      )
          : Center(
        child: Text('hello',
        style: TextStyle(
          color: Colors.black
        ),),
      )
    );
  }
}