
import 'package:flutter/material.dart';
import 'package:readygo/Book.dart';

class BookView extends StatelessWidget {
  final Book book;
  final VoidCallback onTap;

  BookView({super.key, required this.book, required this.onTap });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: Image.asset(book.png,
          height: 200,
          width: 150,),
          iconSize: 200,
          onPressed: onTap,
          
        ),
        Text(book.name)
      ],
    );
  }
}