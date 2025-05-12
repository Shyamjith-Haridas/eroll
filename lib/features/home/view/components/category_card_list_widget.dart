import 'package:eroll/core/constants/app_colors.dart';
import 'package:eroll/core/constants/app_texts.dart';
import 'package:eroll/core/routes/app_route_names.dart';
import 'package:eroll/features/home/view/components/category_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryCardListWidget extends StatelessWidget {
  const CategoryCardListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,

        children: [
          // Attendance
          CategoryCardWidget(
            text: AppTexts.attendaceText,
            icon: Icons.calendar_month_outlined,
            bgColor: AppColors.blue600,
            onTap: () {
              Navigator.pushNamed(context, AppRouteNames.attendanceScreen);
            },
          ),

          // Works
          CategoryCardWidget(
            text: AppTexts.worksText,
            icon: CupertinoIcons.doc_text_fill,
            bgColor: AppColors.orange600,
            onTap: () {
              Navigator.pushNamed(context, AppRouteNames.siteWorksScreen);
            },
          ),

          // Payrol
          CategoryCardWidget(
            text: AppTexts.payrollText,
            icon: Icons.payments_outlined,
            bgColor: AppColors.green600,
            onTap: () {
              //todo: payroll feature
            },
          ),
        ],
      ),
    );
  }
}
