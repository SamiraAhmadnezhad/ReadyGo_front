import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:readygo/Ebook.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
  }
  List<Widget> tabItems = [
    const Ebook(),
    const Ebook(),
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
          title: Text('Ebook'),
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
