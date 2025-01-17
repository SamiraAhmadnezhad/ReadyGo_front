import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:readygo/pages/Account.dart';
import 'package:readygo/pages/Home.dart';
import 'package:readygo/pages/Library.dart';
import 'package:readygo/pages/Shop.dart';
import 'package:readygo/User.dart';
import 'package:readygo/pages/myTheme.dart';

class HomePage extends StatefulWidget{
  const HomePage( {super.key, required this.user});
  final User user;
  @override
  State<HomePage> createState() => _HomePageState(user);
}

class _HomePageState extends State<HomePage> {
  _HomePageState(this.user);
   User user;
  late List<Widget> tabItems = [
    Home(user: user),
   Library(user: user,),
    Shop(user: user,),
    Account(user: user,),
  ];
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: myTheme.iconBool ? myTheme.lightThemeData(context) : myTheme.darkThemeData(context),
      home: Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(icon: Icon(myTheme.iconBool ? myTheme.iconDark : myTheme.iconLight),
                    onPressed: () {
                      setState(() {
                        myTheme.iconBool = !myTheme.iconBool;
                      });
                    }
                )
              ],
              leading: IconButton(
                icon: Icon(Icons.flutter_dash_sharp,
                      color: Colors.white,
                  size: 40,),
                onPressed: () => Navigator.of(context).pop(),
              ),
              backgroundColor: Colors.pink.shade600,
              title: const Text(
                "ReadyGo ",
                style: TextStyle(
                  //fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),

            ),
            body: Center(
              child: tabItems[_selectedIndex],
            ),
            bottomNavigationBar: FlashyTabBar(
              backgroundColor: Colors.grey.shade300,
              animationCurve: Curves.linear,
              selectedIndex: _selectedIndex,
              iconSize: 20,
              showElevation: true,
              height: 55,
              onItemSelected: (index) =>
                  setState(() {
                    _selectedIndex = index;
                  }),
              items: [
                FlashyTabBarItem(
                  inactiveColor: Colors.black,
                  activeColor: Colors.black,
                  icon: Icon(
                    Icons.home,
                    color: Colors.pink.shade800,
                  ),
                  title: Text('Home'),
                ),
                FlashyTabBarItem(
                  inactiveColor: Colors.black,
                  activeColor: Colors.black,
                  icon: Icon(
                    Icons.library_books,
                    color: Colors.pink.shade800,
                  ),
                  title: Text('Library'),
                ),
                FlashyTabBarItem(
                  inactiveColor: Colors.black,
                  activeColor: Colors.black,
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.pink.shade800,
                  ),
                  title: Text('Shop'),
                ),
                FlashyTabBarItem(
                  inactiveColor: Colors.black,
                  activeColor: Colors.black,
                  icon: Icon(
                    Icons.settings,
                    color: Colors.pink.shade800,
                  ),
                  title: Text('Setting'),
                ),
              ],

            )
      ),
    );
  }
}


