import 'package:readygo/Book.dart';

class User{
  String username='';
  String email='';
  String password='';
  List<Book>? recentBooks=[];
  List<Book>? favoriteBooks=[];
  List<Book>? purchasedBooks=[];
  int money=0;
  bool isSpecial=false;
User({
  this.recentBooks,
  required this.email,
  required this.password,
  this.favoriteBooks,
  required this.isSpecial,
  required this.money,
  this.purchasedBooks,
  required this.username,
});
}