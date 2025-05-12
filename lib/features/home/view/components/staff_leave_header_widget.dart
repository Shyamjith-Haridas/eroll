import 'package:eroll/core/constants/app_colors.dart';
import 'package:eroll/core/constants/app_texts.dart';
import 'package:eroll/core/routes/app_route_names.dart';
import 'package:flutter/material.dart';

class StaffLeaveHeaderWidget extends StatelessWidget {
  const StaffLeaveHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          AppTexts.staffOnLeaveHeader,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(width: 10),
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: AppColors.red,
            shape: BoxShape.circle,
          ),
          child: Text(
            '2',
            style: TextStyle(
              fontSize: 12,
              color: AppColors.white,
              fontFamily: 'cabinBold',
            ),
          ),
        ),

        Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, AppRouteNames.staffOnLeaveScreen);
          },
          child: Text(
            AppTexts.seeAllText,
            style: TextStyle(color: AppColors.grey),
          ),
        ),
      ],
    );
  }
}
