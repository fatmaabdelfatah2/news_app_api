import 'package:flutter/material.dart';

class CircleIcon extends StatelessWidget {
   CircleIcon({super.key,
   required this.icon
   });
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      child: Icon(icon,color: Colors.black, size: 18),
    );
  }
}