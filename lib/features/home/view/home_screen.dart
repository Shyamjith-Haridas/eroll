import 'package:eroll/components/custom_padding_widget.dart';
import 'package:eroll/core/constants/app_texts.dart';
import 'package:eroll/core/constants/utility_file.dart';
import 'package:eroll/features/home/view/components/category_card_list_widget.dart';
import 'package:eroll/features/home/view/components/qa_sections_widgets.dart';
import 'package:eroll/features/home/view/components/staff_leave_header_widget.dart';
import 'package:eroll/features/home/view/components/staff_on_leave_tile_widget.dart';
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
                //* Enable this portion later, right now no search functionality
                // SizedBox(height: 30),
                // SearchWidget(),
                SizedBox(height: 40),
                CustomPaddingWidget(
                  pLeft: 20,
                  pRight: 20,
                  child: Text(
                    AppTexts.categoriesHeader,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),

                SizedBox(height: 15),
                CustomPaddingWidget(
                  pLeft: 20,
                  child: CategoryCardListWidget(),
                ), // Main categories cards

                SizedBox(height: 40),
                CustomPaddingWidget(
                  pLeft: 20,
                  pRight: 20,
                  child: StaffLeaveHeaderWidget(),
                ), // Staff leave header

                CustomPaddingWidget(
                  pLeft: 20,
                  pRight: 20,
                  child: StaffOnLeaveTileWidget(),
                ), // Stff leave tile

                SizedBox(height: 40),
                CustomPaddingWidget(
                  pLeft: 20,
                  child: Text(
                    AppTexts.quickActionsHeader,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),

                SizedBox(height: 15),
                CustomPaddingWidget(
                  pLeft: 20,
                  pRight: 20,
                  child: QaSectionsWidgets(),
                ), // Quick actions - staffs, payroll report, attendace
              ],
            ),
          ),
        ),
      ),
    );
  }
}
