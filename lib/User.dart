import 'package:readygo/Book.dart';

class User{
  String name='';
  String age='';
  String field='';
  String studentNumber='';

  String username='';
  String email='';
  String password='';
  List<Book>? recentBooks=[];
  List<Book>? favoriteBooks=[];
  List<Book>? purchasedBooks=[];
  int money=0;
  bool isSpecial=false;
  String profilePhoto;
  int subscription;
  String bySubscription;
User({
  this.subscription=0,
  this.bySubscription='0000/00/00',
  this.studentNumber='',
  this.age='',
  this.name='',
  this.field='',
  this.profilePhoto="assets/images/profile.png",
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