import 'package:readygo/Comment.dart';
import 'package:readygo/Genre.dart';

class Book{
  List<Comment> comments=[];
  String png='';
  String name="";
  String auther="";
  Genre genre=Genre.scary;
  bool isFree=false;
  bool special=false;
  int price=0;
  int year=0;
  bool isAvailable=true;
  int sellNum=0;
  bool isNew=false;
  // bool isFavorite=false;
  // bool isRecent=false;

  Book({
    // required this.isFavorite,
    // required this.isRecent,
    required this.png,
    required this.name,
    required this.auther,
    required this.genre,
    required this.isFree,
    required this.isAvailable,
    required this.price,
    required this.special,
    required this.year,
    required this.sellNum,
    required this.isNew,
    //required this.comments,
  });
}