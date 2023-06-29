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
      appBar: AppBar(title: const Text('Payment Page')),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 40,),
            Image.asset("assets/images/credit card.jpg"),
            SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
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
                    if (pass==user.password)
                    permision=true;
                  });
                },
              ),
            ),
            SizedBox(height: 20,),
            Container(
              width: MediaQuery.of(context).size.width/2,
              child: MaterialButton(
                onPressed: (){
                  setState(() {
                    if (checkSpesial && permision) {
                      user.isSpecial = true;
                      changeUser(user.username,Convertor.userToString(user));
                      Navigator.of(context).pop();
                    } else if (permision) {
                      user.money += amount;
                      changeUser(user.username,Convertor.userToString(user));
                      Navigator.of(context).pop();
                    } else
                      massage="Password incorrect!";
                  });
                },
                color: Colors.pink.shade400,
                height: 35,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(Icons.credit_card),
                    SizedBox(width: 10,),
                    Text(
                      "pay",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        //fontSize: 20,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Text(massage)
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