import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';

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
    //Home(),
    // Library(),
    // Shop(),
    // Account(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 2-40,
          child: Container(
            alignment: Alignment.topCenter,
            child: FlashyTabBar(

              animationCurve: Curves.linear,
              selectedIndex: _selectedIndex,
              iconSize: 20,
              showElevation: true,
              // use this to remove appBar's elevation
              onItemSelected: (index) =>
                  setState(() {
                    _selectedIndex = index;
                  }),
              items: [
                FlashyTabBarItem(
                  icon: Icon(
                    Icons.book,
                    color: Colors.pink,
                  ),
                  title: Text('Ebook'),
                ),
                FlashyTabBarItem(
                  icon: Icon(
                    Icons.music_note,
                    color: Colors.pink,
                  ),
                  title: Text('Audio Book'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}