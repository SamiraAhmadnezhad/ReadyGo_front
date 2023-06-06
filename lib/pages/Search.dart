import 'package:flutter/material.dart';
import 'package:readygo/Book.dart';
import 'package:readygo/BookView1.dart';
import 'package:readygo/User.dart';
import 'package:readygo/pages/BookInformation.dart';
import 'package:readygo/pages/getListBook.dart';

class Search extends StatefulWidget {
  const Search({super.key,required this.user,required this.search});
  final User user;
  final String search;
  @override
  State<Search> createState() => _SearchState(user: user,search: search);
}
class _SearchState extends State<Search> {
  _SearchState({required this.user,required this.search});
  final String search;
  User user;
  List<Book> searchedBook(String name){
    List<Book> result=[];
    for (Book b in getListBook.books) {
      if (b.name.toLowerCase().contains(search))
        result.add(b);
    }
    return result;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade600,
        title: Text(
          "search results : $search",
          style: TextStyle(
            //fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      body:  Container(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Container(
              height: MediaQuery.of(context).size.height-150,
              child: searchedBook(search).isNotEmpty
                  ? ListView.builder(
                addAutomaticKeepAlives: true,
                //padding:const EdgeInsets.all(8.0),
                scrollDirection: Axis.vertical,
                itemCount: searchedBook(search).length,
                itemBuilder: (context,index){
                  final Book=searchedBook(search)[index];
                  return BookView1(
                    book : Book,
                    onTap : (){
                      setState(() {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => BookInformation(user: user, book: Book,)
                          ),
                        );
                      });
                    },
                  );
                },
              )
                  : const Center(
                child: Text(
                  'There is no result',
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