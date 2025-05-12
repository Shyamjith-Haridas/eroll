import 'package:flutter/material.dart';

class QaShortCardWidget extends StatelessWidget {
  const QaShortCardWidget({
    super.key,
    required this.bgColor,
    required this.icon,
    required this.text,
  });

  final Color bgColor;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black38,
        //     spreadRadius: 2,
        //     blurRadius: 6,
        //     offset: Offset(0, 0),
        //   ),
        // ],
      ),
      child: Row(
        spacing: 10,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: bgColor,
            child: Icon(icon, color: Colors.white),
          ),
          Flexible(
            child: Text(
              text,
              style: TextStyle(fontFamily: 'cabinBold'),
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
