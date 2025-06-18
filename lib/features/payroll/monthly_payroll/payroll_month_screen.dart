import 'package:eroll/components/custom_back_button_appbar.dart';
import 'package:eroll/components/custom_tile_border_widget.dart';
import 'package:eroll/components/custom_title_appbar.dart';
import 'package:eroll/core/routes/app_route_names.dart';
import 'package:flutter/material.dart';

class PayrollMonthScreen extends StatelessWidget {
  const PayrollMonthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButtonAppbar(),
        title: CustomTitleAppbar(appBarTitle: 'Months'),
      ),

      body: SafeArea(
        child: ListView.builder(
          itemCount: 12,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRouteNames.staffPayrollReportScreen,
                );
              },
              child: CustomTileBorderWidget(child: Text('Month ${index + 1}')),
            );
          },
          padding: EdgeInsets.symmetric(horizontal: 20),
        ),
      ),
    );
  }
}
