import 'package:flutter/material.dart';
import 'package:readygo/User.dart';

class PurchasePage extends StatefulWidget {
  const PurchasePage({super.key,required this.user,required this.amount});
   final User user;
   final int amount;
  @override
  State<PurchasePage> createState() => _PurchasePageState(user: user,amount: amount);
}

class _PurchasePageState extends State<PurchasePage> {
  _PurchasePageState({required this.user,required this.amount});
  User user;
  int amount;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payment Page')),
      body: Center(
        child: Column(
          children: [
            Image.asset("assets/images/credit card.jpg"),
            TextFormField(
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
                  user.money+=int.parse();
                });
              },
            )
          ],
        ),
      ),
    );
  }
}