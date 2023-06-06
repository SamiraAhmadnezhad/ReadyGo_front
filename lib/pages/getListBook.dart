import 'package:readygo/Book.dart';
import 'package:readygo/Comment.dart';
import 'package:readygo/Genre.dart';

class getListBook{
  static List <Comment> comments=[
    Comment(commentMassage: "good", dislike: 1, like: 0, nameUser: "Fatemeh"),
    Comment(commentMassage: "The Align widget"
        " positions the FlutterLogo"
        " such that the two points are on"
        " top of each other. In this example,"
        " the top left of the FlutterLogo will"
        " be placed at (72.0, 96.0) - (36.0, 48.0) "
        "= (36.0, 48.0) from the top left of"
        " the Align widget.", dislike: 0, like: 4, nameUser: "reza"),
    Comment(commentMassage: "very good", dislike: 2, like: 0, nameUser: "sina"),
    Comment(commentMassage: "very good", dislike: 0, like: 0, nameUser: "sara"),
  ];
  static List<Comment> comEmaty=[];
  static late List<Book> books=[
    Book(
      lastData: DateTime.now(),
      png: "assets/images/hary1.jpg",
      name: "hary2", author: "samira",
      genre: Genre.Criminal,
      isFree: true,
      isAvailable: true,
      price: 0,
      special: false,
      year: 1383,
      sellNum: 20,
      isNew: true,
      about: "Harry Potter is a series of seven"
          " fantasy novels written by British author"
          " J. K. Rowling. The novels chronicle the lives"
          " of a young wizard, Harry Potter, and his friends Hermione Granger and Ron Weasley, all of whom are students at Hogwarts School of Witchcraft and Wizardry. The main story arc concerns Harry's conflict with Lord Voldemort, a dark wizard who intends to become immortal, overthrow the wizard governing body known as the Ministry of Magic and subjugate all wizards and Muggles (non-magical people).",
      comments: comments,
      like: 4
    ),
    Book(
      lastData: DateTime.now(),
      png: "assets/images/hary2.jpg",
      name: "hary2", author: "samira",
      genre: Genre.Scary,
      isFree: false,
      isAvailable: true,
      price: 10,
      special: false,
      year: 1383,
      sellNum: 20,
      isNew: true,
      about: "ekjfhksjhgfkjdhgkjhdgrhtgdhgh",
      comments: comments,
      like: 6,
      isAudioBook: true,
    ),
    Book(
      lastData: DateTime.now(),
      png: "assets/images/hary3.jpg",
      name: "hary3", author: "samira",
      genre: Genre.Criminal,
      isFree: true,
      isAvailable: false,
      price: 0,
      special: false,
      year: 1383,
      sellNum: 20,
      isNew: true,
      about: "ekjfhksjhgfkjdhgkjhdgrhtgdhgh",
      comments: comments,
      like: 8
    ),
    Book(
      lastData: DateTime.now(),
      png: "assets/images/hary4.jpg",
      name: "hary4", author: "samira",
      genre: Genre.Criminal,
      isFree: true,
      isAvailable: true,
      price: 0,
      special: true,
      year: 1383,
      sellNum: 20,
      isNew: true,
      about: "ekjfhksjhgfkjdhgkjhdgrhtgdhgh",
      comments: comEmaty,
      like: 10
    ),
  ];
}