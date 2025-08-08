import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eroll/core/constants/enums.dart';
import 'package:eroll/features/works/create_work/model/create_work_model.dart';
import 'package:flutter/material.dart';

class ViewWorkSiteProvider extends ChangeNotifier {
  bool _isLoading = false;
  List<CreateWorkModel> _workList = [];

  bool get isLoading => _isLoading;

  List<CreateWorkModel> get workList => _workList;

  List<CreateWorkModel> get pendingWorksList =>
      _workList.where((works) => works.status == WorkStatus.pending).toList();

  List<CreateWorkModel> get inProgressWorkList =>
      _workList
          .where((works) => works.status == WorkStatus.inProgress)
          .toList();

  List<CreateWorkModel> get completedWorksList =>
      _workList.where((works) => works.status == WorkStatus.completed).toList();

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> fetchCreatedWorks() async {
    try {
      setLoading(true);

      final snapshot =
          await FirebaseFirestore.instance
              .collection('works')
              .orderBy('createdAt', descending: true)
              .get();

      _workList =
          snapshot.docs.map((e) => CreateWorkModel.fromJson(e.data())).toList();

      log('Fetched ${_workList.length} works');
      log('Pending: ${pendingWorksList.length}');
      log('InProgress: ${inProgressWorkList.length}');
      log('Completed: ${completedWorksList.length}');
    } catch (error) {
      log('Error while fetching created works: $error');
    } finally {
      setLoading(false);
    }
    notifyListeners();
  }
}
