import 'package:eroll/core/constants/app_colors.dart';
import 'package:eroll/core/constants/app_texts.dart';
import 'package:eroll/core/routes/app_route_names.dart';
import 'package:eroll/features/home/view/components/qa_short_card_widget.dart';
import 'package:eroll/features/home/view/components/quick_actions_card_widget.dart';
import 'package:flutter/cupertino.dart';

class QaSectionsWidgets extends StatelessWidget {
  const QaSectionsWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 30,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: QuickActionsCardWidget(
            bgColor: AppColors.deepPurple,
            icon: CupertinoIcons.person_2_square_stack_fill,
            titleText: AppTexts.staffsText,
            subTitleText: AppTexts.totalCountText,
            subTitleText2: '10',
            onTap: () {
              Navigator.pushNamed(context, AppRouteNames.staffsScreen);
            },
          ),
        ),
        Expanded(
          child: Column(
            spacing: 40,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              QaShortCardWidget(
                bgColor: AppColors.green600,
                icon: CupertinoIcons.doc_chart_fill,
                text: AppTexts.payrollReportText,
              ),

              QaShortCardWidget(
                bgColor: AppColors.teal,
                icon: CupertinoIcons.calendar_today,
                text: AppTexts.attendaceReportText,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
