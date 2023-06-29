import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:readygo/Convertor.dart';
import 'package:readygo/pages/HomePage.dart';

class SingUp extends StatefulWidget{
  @override
  State<SingUp> createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  @override
  void initState() {
    super.initState();
  }
  String massage='';
  String username="";
  String password="";
  String checkPassword="";
  String email="";
  String studentnumber='';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.purple,
          title: const Text(
            "Sing Up",
            style: TextStyle(
              //fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Sing Up',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'user name*',
                  hintText: 'enter user name',
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (username){
                  if (username==null) {
                    return "please enter user name!";
                  }
                  // other thing
                },
                onChanged: (String username){
                  setState(() {
                    if (username.isEmpty)
                      massage='please enter user name';
                    else
                      massage="";
                    this.username=username;
                    //print(this.password);
                  });
                },
              ),
              const SizedBox(height: 30),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'email*',
                  hintText: 'enter email',
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (String? email){
                  if (email==null) {
                    return "please enter email!";
                  }
                  // other thing
                },
                onChanged: (String email){
                  setState(() {
                    if (!email.contains("@"))
                      massage='do not use the @ char.';
                    else
                      massage="";
                    this.email=email;
                    //print(this.email);
                  });
                },
              ),
              const SizedBox(height: 30),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'studentnumber*',
                  hintText: 'enter studentnumber',
                  prefixIcon: Icon(Icons.lock),
                ),
                validator: (String? studentnumber){
                  if (studentnumber==null) {
                    return "please enter studentnumber!";
                  }
                  // other thing
                },
                onChanged: (String studentnumber){
                  setState(() {
                    if (password.length<8)
                      massage='studentnumber should be 9 digits';
                    else
                      massage="";
                    this.studentnumber=studentnumber;
                    //print(this.password);
                  });
                },
              ),
              const SizedBox(height: 30),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'password*',
                  hintText: 'enter password',
                  prefixIcon: Icon(Icons.lock),
                ),
                validator: (String? password) {
                  if (password==null) {
                    return "please enter password!";
                  }
                  // other thing
                },
                onChanged: (String password){
                  setState(() {
                    if (password.length<8)
                      massage='password should be 8 charecter';
                    else
                      massage="";
                    this.password=password;
                    //print(this.password);
                  });
                },
              ),
              const SizedBox(height: 30),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'check password*',
                  hintText: 'enter password again',
                  prefixIcon: Icon(Icons.lock),
                ),
                validator: (String? password){
                  if (password==null) {
                    return "please enter password again!";
                  }
                  // other thing
                },
                onChanged: (String password){
                  setState(() {
                    checkPassword=password;
                    if (password!=this.password)
                    massage="The password is not repeated correctly!";
                  });
                },
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: MaterialButton(
                  minWidth: double.infinity,
                  onPressed: (){
                    //check pass and email
                    checkSingUp(email,password,username,studentnumber,password);
                  },
                  color: Colors.purple,
                  child: const Text(
                    'Sing Up',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Text(massage),
            ],
          ),
        ),
      ),
    );
  }

  checkSingUp(String email,String pass,String username,String studentnumber,String password) async {
    String res='';
    if (pass.length<8 || !email.contains("@") || username.isEmpty || studentnumber.length!=9 || password!=checkPassword)
      setState(() {
        massage= "some thing is wrong!";
      });

    else{
      String request="checkSingUp\n$email,,$pass,,$username,,$studentnumber\u0000";
      var socket = await Socket.connect("192.168.1.102", 8000);
      socket.write(request);
      socket.flush();
      var subscription =socket.listen((response) {
        res+=String.fromCharCodes(response);
      });
      await subscription.asFuture<void>();
      List<String> list = LineSplitter().convert(res);
      setState(() {
        massage=list[0];
      });
      if (massage == "Sing up successfully") {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                HomePage(
                    user: Convertor.stringToUser(list[1])
                ),
          ),
        );
      }
    }
  }
}