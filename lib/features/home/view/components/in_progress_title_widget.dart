import 'package:eroll/core/constants/app_colors.dart';
import 'package:eroll/core/constants/app_texts.dart';
import 'package:eroll/core/routes/app_route_names.dart';
import 'package:flutter/material.dart';

class InProgressTitleWidget extends StatelessWidget {
  const InProgressTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppTexts.inProgressHeader,
          style: Theme.of(context).textTheme.headlineMedium,
        ),

        GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRouteNames.siteWorksScreen,
              arguments: 1,
            );
          },
          child: Text(
            AppTexts.seeAllText,
            style: TextStyle(
              color: AppColors.grey,
              //fontFamily: 'cabinBold',
            ),
          ),
        ),
      ],
    );
  }
}
