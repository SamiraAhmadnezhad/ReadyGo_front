class Comment {
  String nameUser = "";
  String commentMassage = "";
  int like = 0;
  int dislike = 0;

  Comment({
    required this.commentMassage,
    required this.dislike,
    required this.like,
    required this.nameUser,
  });
}