class Comment {
  String nameUser = "";
  String commentMassage = "";
  int like;
  int dislike ;

  Comment({
    required this.commentMassage,
    this.dislike=0,
    this.like=0,
    required this.nameUser,
  });
}