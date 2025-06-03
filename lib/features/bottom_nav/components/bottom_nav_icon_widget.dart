import 'package:eroll/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class BottomNavIconWidget extends StatelessWidget {
  const BottomNavIconWidget({
    super.key,
    required this.icons,
    required this.onTap,
    required this.label,
    required this.isActive,
  });

  final IconData icons;
  final String label;
  final VoidCallback onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(
            icons,
            color: isActive ? AppColors.primaryColor : AppColors.grey,
          ),
          Text(label),
        ],
      ),
    );
  }
}
