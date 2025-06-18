import 'package:eroll/components/custom_padding_widget.dart';
import 'package:eroll/core/constants/resource_path.dart';
import 'package:eroll/core/constants/utility_file.dart';
import 'package:eroll/core/routes/app_route_names.dart';
import 'package:eroll/features/home/view/components/in_progress_title_widget.dart';
import 'package:eroll/features/home/view/components/in_progress_work_card_widget.dart';
import 'package:eroll/features/home/view/components/report_card_widget.dart';
import 'package:eroll/features/home/view/components/search_widget.dart';
import 'package:eroll/features/home/view/components/shortcut_menu.dart';
import 'package:eroll/features/upcoming_event/view/upcoming_event_banner.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              UtilityFile.formatDate(DateTime.now()),
              style: TextStyle(fontFamily: 'cabinBold'),
            ),
            Text(
              UtilityFile.currentDay(DateTime.now()),
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        actions: [
          IconButton(icon: Icon(Icons.settings, size: 30), onPressed: () {}),
        ],
        actionsPadding: EdgeInsets.only(right: 10),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Linear Gradient Container
                SizedBox(height: 30),
                CustomPaddingWidget(
                  pLeft: 20,
                  pRight: 20,
                  child: SearchWidget(),
                ),
                SizedBox(height: 30),

                // InProgress Work Title
                CustomPaddingWidget(
                  pLeft: 20,
                  pRight: 20,
                  child: InProgressTitleWidget(),
                ),
                SizedBox(height: 10),

                // InProgress Work Card
                SizedBox(
                  height: 170,
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) => InProgressWorkCardWidget(),
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                SizedBox(height: 30),

                // Shortcut Menu
                CustomPaddingWidget(
                  pLeft: 20,
                  pRight: 20,
                  child: ShortcutMenu(),
                ),
                SizedBox(height: 20),

                CustomPaddingWidget(
                  pLeft: 20,
                  child: Text(
                    'Reports',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                SizedBox(height: 10),

                ReportCardWidget(
                  imagePath: ResourcePath.payrollImage,
                  labelText: 'Payroll Ledger Report',
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRouteNames.payrollMonthListScreen,
                    );
                  },
                ),
                SizedBox(height: 10),
                ReportCardWidget(
                  imagePath: ResourcePath.attendanceImage,
                  labelText: 'Attendance Report',
                  onTap: () {
                    // todo: attendance report screen navigation function
                  },
                ),
                SizedBox(height: 10),
                ReportCardWidget(
                  imagePath: ResourcePath.employeePayrollImage,
                  labelText: 'Staff Payroll Report',
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRouteNames.staffListPayrollScreen,
                    );
                  },
                ),
                SizedBox(height: 20),

                CustomPaddingWidget(
                  pLeft: 20,
                  child: Text(
                    'Upcoming Events',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                SizedBox(height: 20),

                // Card - Banner
                UpcomingEventBanner(),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
