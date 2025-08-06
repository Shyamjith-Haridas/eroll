import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eroll/features/create_staff/model/create_staff_model.dart';
import 'package:flutter/cupertino.dart';

class ViewStaffProvider extends ChangeNotifier {
  List<CreateStaffModel> _viewStaffList = [];
  bool _isLoading = false;

  List<CreateStaffModel> get viewStaffList => _viewStaffList;

  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // fetch staff
  Future<void> fetchStaffs() async {
    setLoading(true);
    try {
      final snapshot =
          await FirebaseFirestore.instance
              .collection('staffs')
              .orderBy('created_at', descending: true)
              .get();

      _viewStaffList =
          snapshot.docs.map((e) {
            return CreateStaffModel.fromMap(e.data());
          }).toList();
      notifyListeners();
    } catch (e) {
      log('Error while fetching the data: $e');
    } finally {
      setLoading(false);
    }
  }

  // delete staff
  Future<void> deleteStaff(String staffId) async {
    try {
      await FirebaseFirestore.instance
          .collection('staffs')
          .doc(staffId)
          .delete();

      log('$staffId deleted');
      notifyListeners();
    } catch (error) {
      log('Error while deleting staff:  $error');
    }
  }

  // update staff details
  Future<void> updateStaff({
    required String staffId,
    required String name,
    required String mobile,
    required String empType,
  }) async {
    try {
      await FirebaseFirestore.instance.collection('staffs').doc(staffId).update(
        {'name': name, 'mobile': mobile, 'emp_type': empType},
      );
      log('$staffId Updated Successfully');
      notifyListeners();
    } catch (error) {
      log('Error while updating staff: $error');
    }
  }
}
