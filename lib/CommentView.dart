
import 'package:flutter/material.dart';
import 'package:readygo/Comment.dart';

class CommentView extends StatelessWidget {
  final Comment comment;
  final VoidCallback onTaplike;
  final VoidCallback onTapDislike;

  CommentView({super.key, required this.comment, required this.onTaplike ,required this.onTapDislike});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                      comment.nameUser,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),),
                  const SizedBox(height: 10,),
                  Container(
                    width: MediaQuery.of(context).size.width-170,
                      child: Text(comment.commentMassage,),
                  ),
                ],
              ),
              Spacer(),
              Column(
                children: [
                  IconButton(
                    onPressed: onTaplike,
                    icon: Icon(Icons.emoji_emotions,
                    color: Colors.grey.shade600,),
                  ),
                  Text(comment.like.toString()),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.heart_broken_rounded,
                    color: Colors.pink.shade600,),
                    onPressed: onTapDislike,
                  ),
                  Text(comment.dislike.toString())
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 10,),
        Container(
          color: Colors.black,
          height: 1,
        ),
        const SizedBox(height: 10,),
      ],
    );
  }
}