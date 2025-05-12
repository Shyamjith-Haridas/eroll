import 'package:flutter/material.dart';

class CategoryCardWidget extends StatelessWidget {
  const CategoryCardWidget({
    super.key,
    required this.text,
    required this.icon,
    required this.bgColor,
    required this.onTap,
  });

  final String text;
  final IconData icon;
  final Color bgColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 140,
        margin: EdgeInsets.only(right: 30),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),

        child: Column(
          spacing: 10,
          children: [
            // Bg circle
            CircleAvatar(
              radius: 30,
              backgroundColor: bgColor,
              child: Icon(icon, size: 35, color: Colors.white),
            ),

            // Category text
            Text(text, style: TextStyle(fontSize: 16, fontFamily: 'cabinBold')),
          ],
        ),
      ),
    );
  }
}


// boxShadow: [
//   BoxShadow(
//     color: Colors.black38,
//     spreadRadius: .5,
//     blurRadius: .5,
//     offset: Offset(0, 0),
//   ),
// ], 
// may be we can use it later for nuemorphism effect