import 'package:eroll/core/constants/app_colors.dart';
import 'package:eroll/core/constants/resource_path.dart';
import 'package:eroll/core/routes/app_route_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StaffsScreen extends StatelessWidget {
  const StaffsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        scrolledUnderElevation: 5,
        title: Text('Staffs', style: TextStyle(fontFamily: 'cabinBold')),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRouteNames.createStaffScreen);
            },
            icon: Icon(CupertinoIcons.add),
          ),
        ],
        actionsPadding: EdgeInsets.only(right: 20),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.strokeColor),
              ),
              child: Row(
                spacing: 15,

                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage(
                      ResourcePath.profileCircleVector,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'John Doe',
                        style: TextStyle(fontFamily: 'cabinBold'),
                      ),
                      Text(
                        'Employee Type',
                        style: TextStyle(color: AppColors.grey),
                      ),
                    ],
                  ),
                  Spacer(),

                  GestureDetector(
                    onTap: () {
                      //todo: Edit employee details function
                    },
                    child: Icon(CupertinoIcons.pencil),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      //todo: Delete employee function
                    },
                    child: Icon(CupertinoIcons.delete, color: AppColors.red),
                  ),
                ],
              ),
            );
          },
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
        ),
      ),
    );
  }
}
