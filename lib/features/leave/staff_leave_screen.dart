import 'package:eroll/features/home/view/components/staff_on_leave_tile_widget.dart';
import 'package:flutter/material.dart';

class StaffLeaveScreen extends StatelessWidget {
  const StaffLeaveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leaves', style: TextStyle(fontFamily: 'cabinBold')),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return StaffOnLeaveTileWidget();
          },
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
        ),
      ),
    );
  }
}
