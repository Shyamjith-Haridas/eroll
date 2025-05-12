import 'package:eroll/components/button_widget.dart';
import 'package:eroll/core/constants/app_colors.dart';
import 'package:eroll/features/create_work/view/components/create_work_calendar_widget.dart';
import 'package:flutter/material.dart';

class UpdateWorkStatusScreen extends StatefulWidget {
  const UpdateWorkStatusScreen({super.key});

  @override
  State<UpdateWorkStatusScreen> createState() => _UpdateWorkStatusScreenState();
}

class _UpdateWorkStatusScreenState extends State<UpdateWorkStatusScreen> {
  List<String> workStatusList = ['Pending', 'In Progress', 'Completed'];
  String? workStatus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Update Work')),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 60),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            // Work/Place
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: AppColors.grey400)),
              ),
              child: TextField(
                minLines: 1,
                maxLines: 2,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Work/Place Name',
                ),
              ),
            ),

            // Work Description
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: AppColors.grey400)),
              ),
              child: TextField(
                maxLines: 8,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Description',
                ),
              ),
            ),

            // Started Date
            CreateWorkCalenderWidget(dateLabel: 'Start Date'),

            // End Date
            CreateWorkCalenderWidget(dateLabel: 'End Date'),

            // Work Status
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: AppColors.grey400)),
              ),
              child: Row(
                children: [
                  Icon(Icons.alarm),
                  SizedBox(width: 10),
                  Text('Status'),
                  Spacer(),
                  Expanded(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButtonFormField<String>(
                        value: workStatus,
                        items:
                            workStatusList.map((element) {
                              return DropdownMenuItem<String>(
                                value: element,
                                child: Text(element),
                              );
                            }).toList(),
                        onChanged: (value) {
                          setState(() {
                            workStatus = value!;
                          });
                        },
                        decoration: InputDecoration.collapsed(hintText: ''),
                        hint: Text('Status'),
                        dropdownColor: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Assigned People List
            GestureDetector(
              onTap: () {
                // todo: show dialog
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: AppColors.grey400)),
                ),
                child: Row(
                  children: [
                    Icon(Icons.person_2_rounded),
                    SizedBox(width: 10),
                    Text('People'),
                    Spacer(),
                    Expanded(
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.purple.shade100,
                          ),
                          Positioned(
                            left: 20,
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.purple.shade200,
                            ),
                          ),
                          Positioned(
                            left: 40,
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.purple.shade300,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [Text('2+')],
                              ),
                            ),
                          ),

                          Positioned(
                            right: 0,
                            child: CircleAvatar(
                              radius: 20,
                              child: Center(
                                child: Text(
                                  '+',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 40),

            // Button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ButtonWidget(
                btnText: 'Update',
                btnColor: AppColors.primaryColor,
                btnAction: () {},
                isLoading: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
