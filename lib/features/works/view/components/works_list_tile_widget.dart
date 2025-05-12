import 'package:eroll/core/constants/app_colors.dart';
import 'package:eroll/core/routes/app_route_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WorksListTileWidget extends StatefulWidget {
  const WorksListTileWidget({super.key, required this.tabIndex});

  final int tabIndex;

  @override
  State<WorksListTileWidget> createState() => _WorksListTileWidgetState();
}

class _WorksListTileWidgetState extends State<WorksListTileWidget> {
  @override
  Widget build(BuildContext context) {
    String workStatus;
    Color statusColor;

    switch (widget.tabIndex) {
      case 0:
        workStatus = 'Pending';
        statusColor = AppColors.blueAccent;
        break;
      case 1:
        workStatus = 'In Progress';
        statusColor = AppColors.primaryColor;
        break;
      case 2:
        workStatus = 'Completed';
        statusColor = AppColors.green;
        break;
      default:
        workStatus = '';
        statusColor = Colors.black;
    }

    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, AppRouteNames.updateWorksScreen);
          },
          child: Container(
            height: 150,
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 15),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(color: AppColors.grey400),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                // Left Side Color Strip
                Container(
                  width: 15,
                  decoration: BoxDecoration(color: AppColors.deepPurple),
                ),

                // Right Side
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(CupertinoIcons.calendar_badge_plus, size: 30),
                            SizedBox(width: 10),
                            Text(
                              'April 24, 2025', // Date
                              style: TextStyle(fontFamily: 'cabinBold'),
                            ),
                            Spacer(),
                            Text('Thursday'), // Day
                          ],
                        ),
                        SizedBox(height: 10),

                        // Work Site name
                        Text(
                          'Work Site Name/ Place/ Address',
                          style: Theme.of(
                            context,
                          ).textTheme.headlineLarge!.copyWith(fontSize: 22),
                        ),
                        SizedBox(height: 10),

                        // Work Status
                        Row(
                          spacing: 10,
                          children: [
                            Text('Status:'),
                            Text(
                              workStatus,
                              style: TextStyle(
                                fontFamily: 'cabinBold',
                                color: statusColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
    );
  }
}
