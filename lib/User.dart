import 'package:readygo/Book.dart';

class User{
  String username='';
  String email='';
  String password='';
  List<Book> recentBooks=[];
  List<Book> favoriteBooks=[];
  List<Book> purchasedbBooks=[];
  int money=0;
  bool isSpecial=false;
User({
  //required this.recentBooks,
  required this.email,
  required this.password,
  //required this.favoriteBooks,
  required this.isSpecial,
  required this.money,
  //required this.purchasedbBooks,
  required this.username,
});
}