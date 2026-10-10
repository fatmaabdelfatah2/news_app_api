import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:news_app_api/screens/home_screen.dart';
import 'package:news_app_api/screens/search_screen.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  List<Widget>screens=[HomeScreen(),SearchScreen()];
  int currIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        buttonBackgroundColor:Colors.amber ,
        color: Color(0xff001F3F),
        items: <Widget>[
          Icon(Icons.home,size: 30,color: Colors.white,),
          Icon(Icons.search_sharp,size: 30,color: Colors.white,),
        ],
        onTap: (index) {
          setState(() {
            currIndex=index;
          });
        },
        ),
    );
  }
}