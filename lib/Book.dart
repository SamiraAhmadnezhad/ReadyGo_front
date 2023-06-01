import 'package:readygo/Genre.dart';
List books= <Book>[];

void addBook (Book x){
  books.add(x);
}

class Book{
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

  Book({required this.name,
    required this.auther,
    required this.genre,
    required this.isFree,
    required this.isAvailable,
    required this.price,
    required this.special,
    required this.year,
    required this.sellNum,
    required this.isNew,
  });
}