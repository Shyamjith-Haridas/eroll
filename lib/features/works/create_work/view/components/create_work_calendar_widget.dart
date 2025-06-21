import 'package:eroll/core/constants/app_colors.dart';
import 'package:eroll/core/constants/utility_file.dart';
import 'package:flutter/material.dart';

class CreateWorkCalenderWidget extends StatefulWidget {
  const CreateWorkCalenderWidget({super.key, required this.dateLabel});

  final String dateLabel;

  @override
  State<CreateWorkCalenderWidget> createState() =>
      _CreateWorkCalenderWidgetState();
}

class _CreateWorkCalenderWidgetState extends State<CreateWorkCalenderWidget> {
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
  }

  Future<void> calender() async {
    final DateTime? dateObject = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2025),
      lastDate: DateTime(2100),
    );

    if (dateObject != null) {
      setState(() {
        selectedDate = dateObject;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.grey400)),
      ),
      child: Row(
        children: [
          Icon(Icons.calendar_month_outlined),
          SizedBox(width: 10),
          Text(widget.dateLabel),
          Spacer(),
          GestureDetector(
            onTap: () async {
              await calender();
            },
            child: Text(
              selectedDate != null
                  ? UtilityFile.formatDateMonthYear(selectedDate!)
                  : UtilityFile.formatDateMonthYear(DateTime.now()),
              style: TextStyle(
                fontFamily: 'cabinBold',
                color: AppColors.blue600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
