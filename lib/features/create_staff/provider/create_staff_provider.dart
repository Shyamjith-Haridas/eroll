import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eroll/features/create_staff/model/create_staff_model.dart';
import 'package:flutter/cupertino.dart';

class CreateStaffProvider extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // add staff
  Future<void> addStaff({
    required String name,
    required String mobile,
    required String empType,
  }) async {
    setLoading(true);
    try {
      final CollectionReference staffReff = FirebaseFirestore.instance
          .collection('staffs');

      final docRef = staffReff.doc(); // Auto generated id
      final staff = CreateStaffModel(
        staffId: docRef.id,
        name: name,
        mobile: mobile,
        empType: empType,
        createdAt: DateTime.now(),
      );

      await docRef.set(staff.toMap());
      log('staff added with id: ${docRef.id}');
      notifyListeners();
      await Future.delayed(Duration(seconds: 2));
    } catch (e) {
      log('Error adding staff: $e');
    } finally {
      setLoading(false);
    }
  }
}
