import 'package:eroll/core/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InProgressWorkCardWidget extends StatelessWidget {
  const InProgressWorkCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      margin: EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                CupertinoIcons.calendar_badge_plus,
                size: 30,
                //color: AppColors.white,
              ),
              SizedBox(width: 10),
              Text(
                'April 24, 2025', // Date
                style: TextStyle(
                  fontFamily: 'cabinBold',
                  color: AppColors.white,
                ),
              ),
              Spacer(),
              Text(
                'Thursday',
                style: TextStyle(
                  fontFamily: 'cabinBold',
                  color: AppColors.white,
                ),
              ), // Day
            ],
          ),
          SizedBox(height: 20),

          Text(
            'Work Site Name..',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              fontSize: 20,
              color: AppColors.white,
            ),
            maxLines: 2,
          ),
          SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: 10,
                children: [
                  Icon(CupertinoIcons.group, size: 30),
                  Text(
                    '7 Staffs',
                    style: TextStyle(
                      color: AppColors.white,
                      fontFamily: 'cabinBold',
                    ),
                  ),
                ],
              ),

              Text(
                '10 Days',
                style: TextStyle(
                  color: AppColors.white,
                  fontFamily: 'cabinBold',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
