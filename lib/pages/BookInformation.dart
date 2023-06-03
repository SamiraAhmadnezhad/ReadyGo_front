import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:readygo/Book.dart';
import 'package:readygo/Comment.dart';
import 'package:readygo/CommentView.dart';
import 'package:readygo/User.dart';
import 'package:readygo/pages/PurchasePage.dart';

class BookInformation extends StatefulWidget {
  const BookInformation({super.key,required this.user,required this.book});
  final User user;
  final Book book;
  @override
  State<BookInformation> createState() => _BookInformationState(user: user,book: book);
}

class _BookInformationState extends State<BookInformation> {
  _BookInformationState({required this.user,required this.book});
  String thisUserComment='';
  User user;
  Book book;
  bool isBy=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Align(
          alignment: Alignment.bottomRight,
          //heightFactor: 5,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: IconButton(
              disabledColor: Colors.white,
              onPressed: () {
                setState(() {
                  if (user.favoriteBooks==null){
                    List<Book> x=[];
                    user.favoriteBooks=x;
                    user.favoriteBooks!.add(book);
                  }
                  bool isin=false;
                  for  (Book b in user.favoriteBooks!){
                    if (b==book)
                      isin=true;
                  }
                  if (isin==false)
                    user.favoriteBooks!.add(book);
                });
              },
              icon: Icon(Icons.favorite,
                color: Colors.pink.shade400,
                size: 30,),
            ),
          ),
        ),
        backgroundColor: Colors.grey.shade600,
        title: const Text(
        "ReadyGo",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(book.png,
              height: 250,
              width: 160,),
              const SizedBox(height: 15,),
              Text(
                book.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20,),
              if (user.purchasedBooks==null)
              (book.isAvailable
               ? Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 30),
                 child: MaterialButton(
                   height: 45,
                    minWidth: double.infinity,
                   onPressed: (){
                     setState(() {
                       book.sellNum++;
                       List<Book> b =[];
                       user.purchasedBooks=b;
                       user.purchasedBooks!.add(book); // check money
                       if (user.recentBooks==null){
                         List<Book> x=[];
                         user.recentBooks=x;
                       }
                       user.recentBooks!.add(book);
                     });
                     Navigator.of(context).push(
                       MaterialPageRoute(
                         builder: (context) => PurchasePage(),
                       ),
                     );
                   },
                    color: Colors.pink.shade400,
                    child: book.isFree
                      ?const Text(
                      "by | free",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    )
                  : Text(
                      "by | ${book.price} Toman",
                      style: const TextStyle(
                      color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
               )
              : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: MaterialButton(
                  height: 45,
                  minWidth: double.infinity,
                  onPressed: () {},
                  color: Colors.pink.shade400,
                  child: const Text(
                    "is not available!"
                        " Notify me when available",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
              ))
              else
                for (Book b in user.purchasedBooks!)
                  if(b!=book)
                    book.isAvailable
                        ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: MaterialButton(
                        height: 45,
                        minWidth: double.infinity,
                        onPressed: (){
                          setState(() {
                            List<Book> b =[];
                            user.purchasedBooks=b;
                            user.purchasedBooks!.add(book); // check money
                          });
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PurchasePage(),
                            ),
                          );
                        },
                        color: Colors.pink.shade400,
                        child: book.isFree
                            ?const Text(
                          "by | free",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        )
                            : Text(
                          "by | ${book.price} Toman",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    )
                        : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: MaterialButton(
                        height: 45,
                        minWidth: double.infinity,
                        onPressed: () {},
                        color: Colors.pink.shade400,
                        child: const Text(
                          "is not available!"
                              " Notify me when available",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    )
              else
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      MaterialButton(
                          onPressed: (){
                            setState(() {
                              user.recentBooks!.remove(book);
                            });
                          },
                        color: Colors.pink.shade400,
                        height: 45,
                        minWidth: double.infinity,
                        child: const Text(
                          "I have read",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      const SizedBox(height: 15,),
                      MaterialButton(
                        onPressed: (){
                        },
                        color: Colors.pink.shade400,
                        height: 45,
                        minWidth: double.infinity,
                        child: const Text(
                            "Open",
                          style: TextStyle(
                            color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                    const SizedBox(height: 15,),
                    if (user.isSpecial==false)
                      const Align(
                        alignment: Alignment.center,
                        child: Text(
                          "By purchasing a subscription"
                              " you can use all the books for free",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    const SizedBox(height: 20,),
                    const Align(
                      alignment: Alignment.topLeft,
                      child:  Text(
                        "About :",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Container(
                      height: 1,
                      color: Colors.black,
                    ),
                    const SizedBox(height: 10,),
                    Text(
                      book.about,
                      style: const TextStyle(
                        fontSize: 17,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 40,),
                    ListTile(
                      //focusColor: Colors.cyanAccent,
                      //selectedColor: Colors.blue,
                      tileColor: Colors.pink.shade100,
                      leading: const Icon(Icons.person),
                      title: const Text(
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
                      tileColor: Colors.pink.shade100,
                      leading: Icon(Icons.picture_as_pdf),
                      title: const Text(
                          "Format"
                      ),
                      trailing: const Text (
                          "Pdf"
                      ),
                    ),
                    ListTile(
                      //focusColor: Colors.cyanAccent,
                      //selectedColor: Colors.blue,
                      tileColor: Colors.white,
                      leading: const Icon(Icons.generating_tokens),
                      title: const Text(
                          "Year Of Publication"
                      ),
                      trailing: Text (
                        book.year.toString(),
                      ),
                    ),
                    const SizedBox(height: 40,),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Comments ",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Container(
                      color: Colors.black,
                      height: 1,
                    ),
                    const SizedBox(height: 10,),
                    Container(
                      height: MediaQuery.of(context).size.height / 2-150,
                      child: book.comments!.isNotEmpty
                          ? ListView.builder(
                        itemCount: book.comments!.length,
                        itemBuilder: (context,index){
                          final Comment= book.comments![index];
                          return CommentView(
                            comment : Comment,
                            onTaplike : (){
                              setState(() {
                                Comment.like++;
                              });
                            },
                            onTapDislike : (){
                              setState(() {
                                Comment.dislike++;
                              });
                            },
                          );
                        },
                      )
                          : const Center(
                        child: Text(
                          'Be the first comments writer.',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40,),
                    Row(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            width: MediaQuery.of(context).size.width-110,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Write a comment',
                                prefixIcon: Icon(Icons.border_color_outlined,
                                  color: Colors.grey,),
                              ),
                              onChanged: (String com){
                                setState(() {
                                  this.thisUserComment=com;
                                });
                              },
                            ),
                          ),
                        ),
                        Align(
                            alignment: Alignment.topRight,
                            child:IconButton(
                              icon: Icon(Icons.send,
                                color: Colors.grey.shade600,),
                              onPressed: () {
                                setState(() {
                                  List<Comment> x=[];
                                  book.comments ??= x;
                                  book.comments?.add(Comment(commentMassage: thisUserComment, nameUser: user.username));
                                });
                              },
                            )
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}