import 'package:flutter/material.dart';
import 'package:readygo/Book.dart';
import 'package:readygo/BookView1.dart';
import 'package:readygo/Genre.dart';
import 'package:readygo/User.dart';
import 'package:readygo/pages/BookInformation.dart';
import 'package:readygo/pages/Search.dart';
import 'package:readygo/pages/getListBook.dart';
class Library extends StatefulWidget {
  const Library({super.key,required this.user});
  final User user;
  @override
  State<Library> createState() => _LibraryState(user: user);
}

class _LibraryState extends State<Library> {
  _LibraryState({required this.user});
  User user;
  String search='';
  void initState() {
    super.initState();
  }
  String dropdownvalue = 'No selected';
  var items = [
    'No selected',
    'E-book',
    'Audio Book',
    'most liked',
  ];
  //late List <Book>? libraryBook=user.purchasedBooks;
  List <Book>? sortShopBook (String dropdownvalue){
    List <Book> result=[];
    if (user.purchasedBooks==null)
      return user.purchasedBooks;
    switch (dropdownvalue){
      case 'No selected':{
        return user.purchasedBooks;
      }
      case 'most liked':{
        user.purchasedBooks!.sort((a, b) => a.like.compareTo(b.like));
        return user.purchasedBooks;
      }
      case 'E-book':{
        for (Book b in user.purchasedBooks!)
          if (b.isAudioBook==false)
            result.add(b);
        break;
      }
      case "Audio Book":{
        for (Book b in user.purchasedBooks!)
          if (b.isAudioBook)
            result.add(b);
        break;
      }
    }
    return result;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    Text("sort by :",
                      style: TextStyle(
                        fontSize: 17,
                      ),),
                    SizedBox(width: 10,),
                    DropdownButton(
                      value: dropdownvalue,
                      icon: const Icon(Icons.format_list_numbered_rtl ),
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },

                    ),
                  ],
                ),
              ),
              //SizedBox(height: 10,),
              const SizedBox(height:5 ,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  color: Colors.black,
                  height: 1,
                ),
              ),
              const SizedBox(height:5 ,),
              Container(
                //color: Colors.pink.shade50,
                height: MediaQuery.of(context).size.height -220,
                child: sortShopBook(dropdownvalue)!=null
                    ? ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: sortShopBook(dropdownvalue)!.length,
                  itemBuilder: (context,index){
                    final Book=sortShopBook(dropdownvalue)![index];
                    return BookView1(
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
                    'There are no books',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}