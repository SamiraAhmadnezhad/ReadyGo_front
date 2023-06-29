import 'dart:io';

import 'package:flutter/material.dart';
import 'package:readygo/Convertor.dart';
import 'package:readygo/User.dart';

class PurchasePage extends StatefulWidget {
  const PurchasePage({super.key,required this.user,required this.amount,required this.checkSpesial});
   final User user;
   final int amount;
   final bool checkSpesial;
  @override
  State<PurchasePage> createState() => _PurchasePageState(user: user,amount: amount,checkSpesial: checkSpesial);
}

class _PurchasePageState extends State<PurchasePage> {
  _PurchasePageState({required this.user,required this.amount, required this.checkSpesial});
  User user;
  int amount;
  bool checkSpesial;
  bool permision=false;
  String massage='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payment Page'),
      backgroundColor: Colors.pink,),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 40,),
            Image.asset("assets/images/credit card.jpg"),
            SizedBox(height: 40,),
            Text(amount.toString()+" Toman",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 30
            ),),
            SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'password*',
                  hintText: 'enter password',
                  prefixIcon: Icon(Icons.lock),
                ),
                validator: (String? password){
                  if (password==null) {
                    return "please enter amount!";
                  }
                  // other thing
                },
                onChanged: (String pass){
                  setState(() {
                    if (pass==user.studentNumber.substring(5))
                    permision=true;
                  });
                },
              ),
            ),
            SizedBox(height: 30,),
            Container(
              width: MediaQuery.of(context).size.width/3,
              child: MaterialButton(
                onPressed: (){
                  //print(user.studentNumber.substring(6));
                  setState(() {
                    if (checkSpesial && permision) {
                      user.isSpecial = true;
                      changeUser(user.username,Convertor.userToString(user));
                      massage="payment successful!";
                    } else if (permision) {
                      user.money += amount;
                      changeUser(user.username,Convertor.userToString(user));
                      massage="payment successful!";
                    } else
                      massage="Password incorrect!";
                  });
                },
                color: Colors.pink,
                height: 35,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(Icons.credit_card,
                    color: Colors.white,),
                    SizedBox(width: 10,),
                    Text(
                      "pay",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 30,),
            Text(massage,
            style: TextStyle(
              fontSize: 20
            ),)
          ],
        ),
      ),
    );
  }
  changeUser (String username,String user) async {
    String res='';
    String request = "changeUser\n$username!!!$user\u0000";
    var socket = await Socket.connect("192.168.1.102", 8000);
    socket.write(request);
    socket.flush();
    var subscription =socket.listen((response) {
      res=String.fromCharCodes(response);
    });
    await subscription.asFuture<void>();
  }
}