import 'package:eroll/components/button_widget.dart';
import 'package:eroll/core/constants/app_colors.dart';
import 'package:eroll/core/constants/data_constants.dart';
import 'package:eroll/core/constants/utility_file.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateWorkScreen extends StatefulWidget {
  const CreateWorkScreen({super.key});

  @override
  State<CreateWorkScreen> createState() => _CreateWorkScreenState();
}

class _CreateWorkScreenState extends State<CreateWorkScreen> {
  DateTime? selectedDate;
  final workSiteController = TextEditingController();
  final descriptionController = TextEditingController();
  final dateTimeController = TextEditingController();
  final addTeamMemberController = TextEditingController();

  int selectedCount = 0;
  List<String> selectedEmployees = [];

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
    dateTimeController.text = UtilityFile.formatDateMonthYear(selectedDate!);
  }

  Future<void> calender() async {
    final DateTime? dateObject = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2025),
      lastDate: DateTime(2100),
    );

    if (dateObject != null) {
      setState(() {
        selectedDate = dateObject;
        dateTimeController.text = UtilityFile.formatDateMonthYear(
          selectedDate!,
        );
      });
    }
  }

  void showPopup() {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          backgroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          content: StatefulBuilder(
            builder: (context, setState) {
              return SizedBox(
                width: MediaQuery.of(ctx).size.width * 0.8,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: DataConstants.checkListEmployees.length,
                  itemBuilder: (context, index) {
                    final emp = DataConstants.checkListEmployees[index];

                    return CheckboxListTile(
                      title: Text(emp),
                      value: selectedEmployees.contains(emp),
                      onChanged: (value) {
                        setState(() {
                          if (value == true) {
                            selectedEmployees.add(emp);
                          } else {
                            selectedEmployees.remove(emp);
                          }
                        });
                      },
                      activeColor: AppColors.primaryColor,
                    );
                  },
                ),
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: Text('Cancel', style: TextStyle(color: AppColors.black)),
            ),
            TextButton(
              onPressed: () {
                addTeamMemberController.text =
                    '${selectedEmployees.length} selected';
                Navigator.pop(context);
              },
              child: Text(
                'Ok',
                style: TextStyle(color: AppColors.primaryColor),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(CupertinoIcons.back),
        ),
        title: Text('Create Work', style: TextStyle(fontFamily: 'cabinBold')),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // work site name field
                Text('Work Site', style: TextStyle(fontFamily: 'cabinBold')),
                SizedBox(height: 5),
                TextField(
                  controller: workSiteController,
                  minLines: 1,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: AppColors.grey400),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // description field
                Text('Description', style: TextStyle(fontFamily: 'cabinBold')),
                SizedBox(height: 5),
                TextField(
                  controller: descriptionController,
                  maxLines: 6,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: AppColors.grey400),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Start Date
                Text('Start Date', style: TextStyle(fontFamily: 'cabinBold')),
                SizedBox(height: 5),
                TextField(
                  controller: dateTimeController,
                  readOnly: true,
                  onTap: () {
                    calender();
                  },

                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.white,
                    suffixIcon: Icon(CupertinoIcons.calendar_today),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: AppColors.grey400),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: AppColors.grey400),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // End date
                Text('End Date', style: TextStyle(fontFamily: 'cabinBold')),
                SizedBox(height: 5),
                TextField(
                  controller: dateTimeController,
                  readOnly: true,
                  onTap: () {
                    calender();
                  },

                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.white,
                    suffixIcon: Icon(CupertinoIcons.calendar_today),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: AppColors.grey400),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: AppColors.grey400),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Add people
                Text('Add Team', style: TextStyle(fontFamily: 'cabinBold')),
                SizedBox(height: 5),
                TextField(
                  readOnly: true,
                  controller: addTeamMemberController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.white,
                    hintText: 'Select Team Members',
                    suffixIcon: Icon(CupertinoIcons.person_3_fill),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: AppColors.grey400),
                    ),
                  ),
                  onTap: showPopup,
                ),
                SizedBox(height: 40),

                // Button
                ButtonWidget(
                  btnText: 'Create Work',
                  btnColor: AppColors.primaryColor,
                  btnAction: () {},
                  isLoading: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
