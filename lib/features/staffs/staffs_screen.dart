import 'package:eroll/core/constants/app_colors.dart';
import 'package:eroll/core/constants/resource_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StaffsScreen extends StatelessWidget {
  const StaffsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Staffs'),
        actions: [IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.add))],
        actionsPadding: EdgeInsets.only(right: 20),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(top: 15),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              spacing: 15,
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage(ResourcePath.profileCircleVector),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('John Doe', style: TextStyle(fontFamily: 'cabinBold')),
                    Text(
                      'Employee Type',
                      style: TextStyle(color: AppColors.grey),
                    ),
                  ],
                ),
                Spacer(),
                IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.pencil)),
                IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.delete)),
              ],
            ),
          );
        },
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      ),
    );
  }
}
