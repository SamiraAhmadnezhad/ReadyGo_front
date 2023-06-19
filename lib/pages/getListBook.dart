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
    Comment(commentMassage: "very good", dislike: 2, like: 5, nameUser: "sina"),
    Comment(commentMassage: "very good", dislike: 0, like: 4, nameUser: "sara"),
  ];
  static List<Comment> comEmaty=[];
  static late List<Book> books=[
    Book(
      lastData: DateTime.now(),
      png: "assets/images/hary1.jpg",
      name: "Harry Potter 1", author: "J. K. Rowling",
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
      name: "Harry Potter 2", author: "J. K. Rowling",
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
        name: "Harry Potter 3", author: "J. K. Rowling",
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
        name: "Harry Potter 4", author: "J. K. Rowling",
      genre: Genre.Criminal,
      isFree: true,
      isAvailable: true,
      price: 0,
      special: true,
      year: 1383,
      sellNum: 20,
      isNew: true,
      about: "Harry Potter is a series of seven fantasy novels written by British author J. K. Rowling. The novels chronicle the lives of a young wizard, Harry Potter, and his friends Hermione Granger and Ron Weasley, all of whom are students at Hogwarts School of Witchcraft and Wizardry",
      comments: comEmaty,
      like: 10
    ),
    Book(
        lastData: DateTime.now(),
        png: "assets/images/hary5.jpg",
        name: "Harry Potter 5", author: "J. K. Rowling",
        genre: Genre.Romantic,
        isFree: false,
        isAvailable: true,
        price: 20,
        special: false,
        year: 1383,
        sellNum: 19,
        isNew: false,
        about: "ekjfhksjhgfkjdhgkjhdgrhtgdhgh",
        comments: comments,
        like: 8
    ),
    Book(
        lastData: DateTime.now(),
        png: "assets/images/hary6.jpg",
        name: "Harry Potter 6", author: "J. K. Rowling",
        genre: Genre.Romantic,
        isFree: false,
        isAvailable: true,
        price: 0,
        special: true,
        year: 1383,
        sellNum: 20,
        isNew: false,
        about: "ekjfhksjhgfkjdhgkjhdgrhtgdhgh",
        comments: comments,
        like: 12
    ),
    Book(
        lastData: DateTime.now(),
        png: "assets/images/hary7.jpg",
        name: "Harry Potter 7", author: "J. K. Rowling",
        genre: Genre.Academic,
        isFree: false,
        isAvailable: true,
        price: 20,
        special: false,
        year: 1383,
        sellNum: 20,
        isNew: false,
        about: "ekjfhksjhgfkjdhgkjhdgrhtgdhgh",
        comments: comments,
        like: 12,
      isAudioBook: true,
    ),
  ];
}