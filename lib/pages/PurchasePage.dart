import 'package:flutter/material.dart';
import 'package:readygo/User.dart';

class PurchasePage extends StatefulWidget {
  const PurchasePage({super.key,required this.user});
  final User user;
  @override
  State<PurchasePage> createState() => _PurchasePageState(user: user);
}

class _PurchasePageState extends State<PurchasePage> {
  _PurchasePageState({required this.user});
  User user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Screen')),
      body: const Center(
        child: Text(
          'This is a new screen',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}