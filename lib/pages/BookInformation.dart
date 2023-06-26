
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:readygo/Book.dart';
import 'package:readygo/Comment.dart';
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
  String thisUserComment='';
  User user;
  Book book;
  bool isBy=false;
  Color star1=Colors.grey.shade600;
  Color star2=Colors.grey.shade600;
  Color star3=Colors.grey.shade600;
  Color star4=Colors.grey.shade600;
  Color star5=Colors.grey.shade600;
  Color favorite=Colors.white;
  bool checkNull (List<Book>? books){
    if (books==null)
      return true;
    else if (books!.isEmpty)
      return true;
    for (Book b in books){
      if (b==book)
      return false;
    }
    return true;
  }
  List<Comment> sortComment (){
    book.comments!.sort((a, b) => b.like.compareTo(a.like));
    return book.comments!;
  }
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
                  favorite=Colors.pink;
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
                  book.like++;
                });
              },
              icon: Icon(Icons.favorite,
                color: favorite,
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

              if (checkNull(user.purchasedBooks)==false)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        MaterialButton(
                          onPressed: (){
                            setState(() {
                              user.recentBooks!.remove(book);
                              print(checkNull(user.purchasedBooks));
                            });
                          },
                          color: Colors.pink.shade400,
                          height: 45,
                          minWidth: double.infinity,
                          child: book.isAudioBook
                            ?const Text(
                            "I have heard",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),
                          )
                              :const Text(
                            "I have read",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),
                          )
                        ),
                        const SizedBox(height: 15,),
                        MaterialButton(
                          onPressed: (){
                            // open pdf
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
                  )

                    else
                      if (book.isAvailable==false)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: MaterialButton(
                          height: 45,
                          minWidth: double.infinity,
                          onPressed: () {
                            // alarm is available
                          },
                          color: Colors.pink.shade400,
                          child: const Text(
                          "is not available!"
                          " Notify me when available",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            ),
                          ),
                        ),
                      )
                      else
                        if (user.isSpecial==true)
                            Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: MaterialButton(
                            height: 45,
                            minWidth: double.infinity,
                            onPressed: (){
                              setState(() {
                                if (user.money>=book.price){
                                  user.money-=book.price;
                                  book.sellNum++;
                                  if (user.purchasedBooks==null){
                                    List<Book> y=[];
                                    user.purchasedBooks=y;
                                  }
                                  user.purchasedBooks!.add(book); // check money
                                  if (user.recentBooks==null){
                                    List<Book> x=[];
                                    user.recentBooks=x;
                                  }
                                  user.recentBooks!.add(book);
                                }
                              });
                            },
                            color: Colors.pink.shade400,
                            child:const Text(
                            "by | free",
                            style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            ),
                            )
                            ),
                            )
                        else
                          if (book.special)
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 30),
                              child: MaterialButton(
                                height: 45,
                                minWidth: double.infinity,
                                onPressed: () {
                                  //
                                },
                                color: Colors.pink.shade400,
                                child: const Text(
                                  "Buy a special subscription",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            )
                          else
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 30),
                              child: MaterialButton(
                                height: 45,
                                minWidth: double.infinity,
                                onPressed: (){
                                  setState(() {
                                    if (user.money>=book.price){
                                      user.money-=book.price;
                                      book.sellNum++;
                                      if (user.purchasedBooks==null){
                                        List<Book> y=[];
                                        user.purchasedBooks=y;
                                      }
                                      user.purchasedBooks!.add(book); // check money
                                      if (user.recentBooks==null){
                                        List<Book> x=[];
                                        user.recentBooks=x;
                                      }
                                      user.recentBooks!.add(book);
                                    }
                                  });
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
                      tileColor: Colors.pink.shade100,
                      leading: Icon(Icons.picture_as_pdf),
                      title: const Text(
                          "Format"
                      ),
                      trailing: book.isAudioBook
                        ?const Text (
                          "mp3"
                      )
                          :const Text (
                          "pdf"
                      )
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
                      Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Rate this book : ${book.rate.toString()}",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    const SizedBox(height: 5,),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Tell others what you think",
                        // style: TextStyle(
                        //     fontSize: 20,
                        //     fontWeight: FontWeight.bold
                        // ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Container(
                      color: Colors.black,
                      height: 1,
                    ),
                    const SizedBox(height: 10,),
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        setState(() {
                          book.numRate++;
                          book.rate+=(rating/book.numRate);
                        });
                      },
                    ),
                    const SizedBox(height: 10,),
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
                        itemCount: sortComment().length,
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