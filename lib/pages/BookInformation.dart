import 'package:flutter/material.dart';
import 'package:readygo/User.dart';

class BookInformation extends StatefulWidget {
  const BookInformation({super.key,required this.user});
  final User user;
  @override
  State<BookInformation> createState() => _BookInformationState(user: user);
}

class _BookInformationState extends State<BookInformation> {
  _BookInformationState({required this.user});
  User user;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}