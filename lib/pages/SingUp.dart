import 'package:flutter/material.dart';
import 'package:readygo/Book.dart';
import 'package:readygo/Comment.dart';
import 'package:readygo/Genre.dart';
import 'package:readygo/User.dart';
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
  String username="";
  String password="";
  String email="";
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
      body: Padding(
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
              validator: (String? username){
                if (username==null) {
                  return "please enter user name!";
                }
                // other thing
              },
              onChanged: (String username){
                setState(() {
                  this.username=username;
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
                  this.email=email;
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
              validator: (String? password){
                if (password==null) {
                  return "please enter password!";
                }
                // other thing
              },
              onChanged: (String password){
                setState(() {
                  this.password=password;
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
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HomePage(
                        user: User(
                        password: password,
                        email: email,
                        isSpecial: false,
                        money: 0,
                        username: 'Asghar',
                      ),
                      ),
                    ),
                  );
                },
                color: Colors.purple,
                child: const Text(
                  'login',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}