import 'package:eroll/core/constants/app_colors.dart';
import 'package:eroll/core/constants/app_texts.dart';
import 'package:flutter/material.dart';

import 'attendance_quick_report_card_widget.dart';

class AttendanceCardWidget extends StatelessWidget {
  const AttendanceCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        spacing: 5,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppTexts.attendaceText,
            style: TextStyle(color: Colors.grey, fontFamily: 'cabinBold'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AttendanceQuickReportCardWidget(
                  count: '7',
                  label: 'Present',
                  color: AppColors.primaryColor,
                ),
                AttendanceQuickReportCardWidget(
                  count: '3',
                  label: 'Absent',
                  color: AppColors.red,
                ),
                AttendanceQuickReportCardWidget(
                  count: '10',
                  label: 'Total',
                  color: AppColors.teal,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
