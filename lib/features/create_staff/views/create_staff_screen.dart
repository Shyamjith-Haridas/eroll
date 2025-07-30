import 'package:eroll/components/button_widget.dart';
import 'package:eroll/core/constants/app_colors.dart';
import 'package:eroll/core/constants/data_constants.dart';
import 'package:eroll/core/constants/utility_file.dart';
import 'package:eroll/features/create_staff/provider/create_staff_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateStaffScreen extends StatefulWidget {
  const CreateStaffScreen({super.key});

  @override
  State<CreateStaffScreen> createState() => _CreateStaffScreenState();
}

class _CreateStaffScreenState extends State<CreateStaffScreen> {
  String? selectedValue;
  final nameController = TextEditingController();
  final mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Staff', style: TextStyle(fontFamily: 'cabinBold')),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(CupertinoIcons.back),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              // Employee name
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Staff Name'),
              ),
              SizedBox(height: 20),

              // Employee phone number
              TextField(
                controller: mobileController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(label: Text('Phone Number')),
              ),
              SizedBox(height: 20),

              // Employee type - dropdown
              SizedBox(
                width: double.infinity,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedValue,
                        items:
                            DataConstants.employeeType
                                .map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                })
                                .toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedValue = newValue!;
                          });
                        },
                        underline: SizedBox(),
                        hint: Text('Select Work Mode'),
                        borderRadius: BorderRadius.circular(10),
                        dropdownColor: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Create button
              Consumer<CreateStaffProvider>(
                builder: (context, createStaffProvider, _) {
                  return ButtonWidget(
                    btnText: 'Create',
                    btnColor: AppColors.primaryColor,
                    isLoading: createStaffProvider.isLoading,
                    btnAction: () async {
                      await createStaffProvider.addStaff(
                        name: nameController.text.trim(),
                        mobile: mobileController.text.trim(),
                        empType: selectedValue ?? '',
                      );

                      if (!mounted) return;
                      UtilityFile.showSnackBar(
                        'Staff added successfully',
                        context,
                      );
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
