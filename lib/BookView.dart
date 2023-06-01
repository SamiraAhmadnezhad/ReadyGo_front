
import 'package:flutter/material.dart';
import 'package:readygo/Book.dart';

class BookView extends StatelessWidget{
  final Book book;
  final VoidCallback onTap;
  BookView ({super.key, required this.book,required this.onTap });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(book.name),
      subtitle: Text(book.auther),
      trailing: Image.asset(book.png),
      onTap: onTap,
      tileColor: Colors.lightBlueAccent,
    );
  }

}