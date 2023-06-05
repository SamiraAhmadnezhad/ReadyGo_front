import 'package:readygo/Comment.dart';
import 'package:readygo/Genre.dart';

class Book{
  DateTime lastData;
  List<Comment>? comments;
  String png='';
  String name="";
  String author="";
  Genre genre=Genre.Scary;
  bool isFree=false;
  bool special=false;
  int price;
  int year;
  bool isAvailable=true;
  int sellNum;
  bool isNew=false;
  String about='';
  int like=0;
  int numRate=0;
  double rate=0.0;
  Book({
    required this.png,
    required this.lastData,
    required this.name,
    required this.author,
    required this.genre,
    required this.isFree,
    required this.isAvailable,
    required this.price,
    required this.special,
    required this.year,
    this.sellNum=0,
    this.like=0,
    required this.isNew,
    required this.about,
    this.comments,
    this.rate=0.0,
    this.numRate=0
  });
}