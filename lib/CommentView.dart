
import 'package:flutter/material.dart';
import 'package:readygo/Book.dart';
import 'package:readygo/Comment.dart';

class CommentView extends StatelessWidget {
  final Comment comment;
  final VoidCallback onTap;

  CommentView({super.key, required this.comment, required this.onTap });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // IconButton(
        //   onPressed: onTap,
        //   icon: Icon(Icons.heart)
        //
        // ),
        // Text(book.name)
      ],
    );
  }
}