import 'package:flutter/material.dart';

class SingUp extends StatefulWidget{
  @override
  State<SingUp> createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.deepPurple,
          title: const Text(
            "Sing Up",
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