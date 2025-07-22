import 'package:eroll/core/constants/app_colors.dart';
import 'package:eroll/core/constants/resource_path.dart';
import 'package:flutter/material.dart';

class AttendanceTileWidget extends StatefulWidget {
  const AttendanceTileWidget({super.key});

  @override
  State<AttendanceTileWidget> createState() => _AttendanceTileWidgetState();
}

class _AttendanceTileWidgetState extends State<AttendanceTileWidget> {
  bool value1 = true;

  static const WidgetStateProperty<Icon> thumbIcon =
      WidgetStateProperty<Icon>.fromMap(<WidgetStatesConstraint, Icon>{
        WidgetState.selected: Icon(Icons.check),
        WidgetState.any: Icon(Icons.close),
      });

  static WidgetStateProperty<Color> trackOutlineColor =
      WidgetStateProperty.fromMap(<WidgetStatesConstraint, Color>{
        WidgetState.selected: AppColors.primaryColor,
        WidgetState.any: AppColors.red,
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.strokeColor),
      ),
      child: Row(
        spacing: 15,
        children: [
          // Profile
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(ResourcePath.profileCircleVector),
          ),

          // Staffs name
          SizedBox(
            width: 150,
            child: Text(
              'John Doe',
              style: TextStyle(fontFamily: 'cabinBold'),
              softWrap: true,
            ),
          ),
          Spacer(),

          // Toggle
          Switch(
            activeColor: AppColors.primaryColor,
            inactiveThumbColor: AppColors.red,
            value: value1,
            thumbIcon: thumbIcon,
            trackOutlineColor: trackOutlineColor,
            onChanged: (value) {
              setState(() {
                value1 = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
