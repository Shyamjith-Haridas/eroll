import 'package:flutter/material.dart';

class OnboardTileWidget extends StatelessWidget {
  const OnboardTileWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.iconColor,
  });

  final IconData icon;
  final Color iconColor;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Icon(icon, size: 30, color: iconColor),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'cabinBold',
                  ),
                ),
                Text(subTitle, softWrap: true, style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
