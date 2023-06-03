import 'package:flutter/material.dart';
import 'package:readygo/BookView.dart';
import 'package:readygo/User.dart';
import 'package:readygo/pages/BookInformation.dart';

class Library extends StatefulWidget {
  const Library({super.key,required this.user});
  final User user;
  @override
  State<Library> createState() => _LibraryState(user: user);
}

class _LibraryState extends State<Library> {
  _LibraryState({required this.user});
  String search='';
  User user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 10,),
            Container(
              //color: Colors.pink.shade50,
              height: MediaQuery.of(context).size.height / 2-220,
              child: user.purchasedBooks!=null
                  ? ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: user.purchasedBooks!.length,
                itemBuilder: (context,index){
                  final Book=user.purchasedBooks![index];
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
    );
  }
}