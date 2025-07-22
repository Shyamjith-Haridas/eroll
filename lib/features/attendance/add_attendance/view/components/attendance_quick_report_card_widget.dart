import 'package:flutter/material.dart';

class AttendanceQuickReportCardWidget extends StatelessWidget {
  const AttendanceQuickReportCardWidget({
    super.key,
    required this.count,
    required this.label,
    required this.color,
  });

  final String count;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count,
          style: TextStyle(
            fontSize: 25,
            color: color,
            fontWeight: FontWeight.w800,
          ),
        ),
        Text(label, style: TextStyle(fontSize: 14, color: Colors.grey)),
      ],
    );
  }
}
