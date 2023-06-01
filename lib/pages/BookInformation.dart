import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readygo/Book.dart';
import 'package:readygo/CommentView.dart';
import 'package:readygo/User.dart';

class BookInformation extends StatefulWidget {
  const BookInformation({super.key,required this.user,required this.book});
  final User user;
  final Book book;
  @override
  State<BookInformation> createState() => _BookInformationState(user: user,book: book);
}

class _BookInformationState extends State<BookInformation> {
  _BookInformationState({required this.user,required this.book});
  User user;
  Book book;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CupertinoColors.activeBlue,
        // title: Text(book.name,
        //   style: const TextStyle(
        //     //fontWeight: FontWeight.bold,
        //     fontSize: 20,
        //     color: Colors.white,
        //   ),
        // ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(book.png,
              height: 250,
              width: 160,),
              const SizedBox(height: 30,),
              Text(
                book.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 30,),
              book.isAvailable
               ? Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 30),
                 child: MaterialButton(
                    minWidth: double.infinity,
                    onPressed: () {},
                    color: CupertinoColors.activeBlue,
                    child: book.isFree
                      ?const Text(
                      "by | free",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  : Text(
                      "by | ${book.price} Toman",
                      style: const TextStyle(
                      color: Colors.white,
                      ),
                    ),
                  ),
               )
              : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: MaterialButton(
                  minWidth: double.infinity,
                  onPressed: () {},
                  color: CupertinoColors.activeBlue,
                  child: const Text(
                    "is not available!",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40,),
              const Text(
                "About :",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 15,),
               Text(
                book.about,
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 40,),
              ListTile(
                //focusColor: Colors.cyanAccent,
                //selectedColor: Colors.blue,
                tileColor: Colors.blue.shade100,
                  leading: Icon(Icons.person),
                  title: Text(
                    "Auther"
                  ),
                  trailing: Text (
                    book.author
                  ),
              ),
              ListTile(
                //focusColor: Colors.cyanAccent,
                //selectedColor: Colors.blue,
                tileColor: Colors.white,
                leading: Icon(Icons.money),
                title: Text(
                    "Price"
                ),
                trailing: Text (
                    book.price.toString(),
                ),
              ),
              ListTile(
                //focusColor: Colors.cyanAccent,
                //selectedColor: Colors.blue,
                tileColor: Colors.blue.shade100,
                leading: Icon(Icons.picture_as_pdf),
                title: Text(
                    "Format"
                ),
                trailing: Text (
                    "Pdf"
                ),
              ),
              ListTile(
                //focusColor: Colors.cyanAccent,
                //selectedColor: Colors.blue,
                tileColor: Colors.white,
                leading: Icon(Icons.generating_tokens),
                title: Text(
                    "Year Of Publication"
                ),
                trailing: Text (
                    book.year.toString(),
                ),
              ),
              const SizedBox(height: 40,),
              // Container(
              //   child: book.comments.isNotEmpty
              //       ? ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     itemCount: book.comments.length,
              //     itemBuilder: (context,index){
              //       final Comment=book.comments[index];
              //       return CommentView(
              //         comment : Comment,
              //         onTap : (){
              //           //empty
              //         },
              //       );
              //     },
              //   )
              //       : const Center(
              //     child: Text(
              //       'There are no Comment!',
              //       style: TextStyle(
              //         color: Colors.black,
              //         fontSize: 20,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}