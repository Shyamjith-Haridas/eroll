import 'dart:developer';

import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:eroll/components/button_widget.dart';
import 'package:eroll/core/constants/app_colors.dart';
import 'package:eroll/core/constants/app_texts.dart';
import 'package:flutter/material.dart';

import 'components/attendance_card_widget.dart';
import 'components/attendance_tile_widget.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  DateTime? selectedDate;
  bool showAttendanceCard = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppTexts.attendaceText,
          style: TextStyle(fontFamily: 'cabinBold'),
        ),

        elevation: 1,
        scrolledUnderElevation: 5,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                if (showAttendanceCard) ...[
                  SizedBox(height: 20),
                  AttendanceCardWidget(), // Day wise Attendance Report Card
                  SizedBox(height: 20),
                ],

                // Calender
                EasyDateTimeLine(
                  activeColor: AppColors.primaryColor,
                  initialDate: DateTime.now(),
                  onDateChange: (date) {
                    selectedDate = date;
                  },
                  dayProps: const EasyDayProps(
                    todayHighlightStyle: TodayHighlightStyle.withBackground,
                    todayHighlightColor: Colors.black26,
                    borderColor: Colors.grey,
                  ),
                ),
                SizedBox(height: 20),

                // List of Employees - Attendance
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return AttendanceTileWidget();
                  },
                  physics: NeverScrollableScrollPhysics(),
                ),
                SizedBox(height: 20),

                // Button
                ButtonWidget(
                  btnText: AppTexts.submitText,
                  btnColor: AppColors.primaryColor,
                  btnAction: () {
                    //todo: attendance feature
                    log('attendance');
                  },
                  isLoading: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
