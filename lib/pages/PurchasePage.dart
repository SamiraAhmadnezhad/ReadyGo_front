import 'package:flutter/material.dart';
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
  String pass='';
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
                  user.money+=amount;
                });
              },
            ),
            Container(
              width: MediaQuery.of(context).size.width/2,
              child: MaterialButton(
                onPressed: (){
                  setState(() {
                    if (checkSpesial)
                      user.isSpecial=true;
                    else
                      user.money+=amount;
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
          ],
        ),
      ),
    );
  }
}