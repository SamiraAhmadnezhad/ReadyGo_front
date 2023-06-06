
import 'package:flutter/material.dart';
import 'package:readygo/Book.dart';

class BookView extends StatelessWidget {
  final Book book;
  final VoidCallback onTap;

  BookView({super.key, required this.book, required this.onTap });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          IconButton(
            //style:IconButton.styleFrom(foregroundColor: Colors.green) ,
            icon: Image.asset(book.png,
            // height: 100,
            // width: 100,
            ),
            iconSize: MediaQuery.of(context).size.height / 6,
            onPressed: onTap,

          ),
          Text(book.name)
        ],
      ),
    );
  }
}