import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:readygo/pages/AudioBook.dart';
import 'package:readygo/pages/Ebook.dart';
import 'package:readygo/User.dart';

class Home extends StatefulWidget {
  const Home({super.key,required this.user});
  final User user;
  @override
  State<Home> createState() => _HomeState(user: user);
}

class _HomeState extends State<Home> {
  _HomeState({required this.user});
  User user;
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
  }
  late List<Widget> tabItems = [
    Ebook(user: user),
    AudioBook(user: user),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: tabItems[_selectedIndex],
        ),
        bottomNavigationBar:FlashyTabBar(
          height: 55,
          backgroundColor: Colors.grey.shade200,
        animationCurve: Curves.linear,
        selectedIndex: _selectedIndex,
        iconSize: 20,
        showElevation: false,
        onItemSelected: (index) =>
        setState(() {
        _selectedIndex = index;
        }),
            items: [
            FlashyTabBarItem(
              inactiveColor: Colors.black,
              activeColor: Colors.black,
            icon: Icon(
            Icons.book,
            color: Colors.pink.shade800,
            ),
            title: Text('E_book'),
            ),
            FlashyTabBarItem(
              inactiveColor: Colors.black,
              activeColor: Colors.black,
            icon: Icon(
            Icons.headset,
            color: Colors.pink.shade800,
          ),
          title: Text('Audio Book'),
            ),
          ],
        ),
    );
  }
}
