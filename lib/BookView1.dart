
import 'package:flutter/material.dart';
import 'package:readygo/Book.dart';

class BookView1 extends StatelessWidget {
  final Book book;
  final VoidCallback onTap;

  BookView1({super.key, required this.book, required this.onTap });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                //style:IconButton.styleFrom(foregroundColor: Colors.green) ,
                icon: Image.asset(book.png,
                ),
                iconSize: MediaQuery.of(context).size.height / 5,
                onPressed: onTap,

              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    children: [
                      Text(book.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),),
                      const SizedBox(width: 10,),
                      Icon(Icons.diamond_outlined,
                      color: Colors.blue,)
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Text(
                    "Auther : ${book.author}",
                    ),
                  const SizedBox(height: 10,),
                  Text(
                    "Price : ${book.price}",
                    ),
                  const SizedBox(height: 10,),
                  Text(
                    "Rate : ${book.rate}",
                    ),
                  const SizedBox(height: 10,),
                  Text(
                  book.genre.toString(),
                    ),
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 1,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}