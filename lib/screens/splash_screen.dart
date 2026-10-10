import 'package:flutter/material.dart';
import 'package:news_app_api/screens/home_screen.dart';

import '../widgets/nav_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const NavBar()),
      );
    });
  }

  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFF001F3F), 
      body: Center(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                 
              Image.asset(
                'assets/images/logo_icon.png',
                height: 100,
              ),
               
           
              Image.asset(
                'assets/images/logo_text.png',
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}