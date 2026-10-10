import 'package:flutter/material.dart';

import 'circle_icon.dart';

class CustomAppbarDetails extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppbarDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading:GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child:
           CircleIcon(icon: Icons.arrow_back_ios_rounded)),
       
        centerTitle: true,
        title:  Text(
    'News Detail',
    style: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
  ),
  actions: [
    
  CircleIcon(icon: Icons.save)
   
  ],
      );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}



