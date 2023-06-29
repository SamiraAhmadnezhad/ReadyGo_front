import 'package:readygo/Book.dart';
import 'package:readygo/Comment.dart';

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
  static List<Book> books=[];
}