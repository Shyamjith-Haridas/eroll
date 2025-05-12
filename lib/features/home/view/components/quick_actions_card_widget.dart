import 'package:flutter/material.dart';

class QuickActionsCardWidget extends StatelessWidget {
  const QuickActionsCardWidget({
    super.key,
    required this.bgColor,
    required this.icon,
    required this.titleText,
    required this.subTitleText,
    required this.subTitleText2,
    required this.onTap,
  });

  final Color bgColor;
  final IconData icon;
  final String titleText;
  final String subTitleText;
  final String subTitleText2;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: bgColor,
                  child: Icon(icon, color: Colors.white),
                ),
                Text(titleText, style: TextStyle(fontFamily: 'cabinBold')),
              ],
            ),
            SizedBox(height: 30),
            Text(subTitleText),
            Text(
              subTitleText2,
              style: TextStyle(
                fontSize: 40,
                fontFamily: 'cabinBold',
                color: Colors.blue.shade900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
