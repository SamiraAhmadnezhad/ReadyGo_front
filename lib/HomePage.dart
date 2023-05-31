import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key, required this.password,required this.email});
  final String email;
  final String password;
  @override
  State<HomePage> createState() => _HomePageState(password,email);
}

class _HomePageState extends State<HomePage> {
  final String email;
  final String password;
  _HomePageState( this.password, this.email);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.deepPurple,
          title: const Text(
            "Ready Go",
            style: TextStyle(
              //fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.white,
            ),
          ),
        ),
    );
  }
}