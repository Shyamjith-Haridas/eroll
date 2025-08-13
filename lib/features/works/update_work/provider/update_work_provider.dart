import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eroll/features/create_staff/model/create_staff_model.dart';
import 'package:eroll/features/staffs/provider/view_staff_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class UpdateWorkProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  DateTime? _startDate;
  DateTime? get startDate => _startDate;

  DateTime? _endDate;
  DateTime? get endDate => _endDate;

  String? _workStatus;
  String? get workStatus => _workStatus;

  List<CreateStaffModel> _allStaffs = [];
  List<CreateStaffModel> get allStaffs => _allStaffs;

  final List<CreateStaffModel> _selectedStaffs = [];
  List<CreateStaffModel> get selectedStaffs => _selectedStaffs;

  bool _isWorkCompletedFlag = false;
  bool get isWorkCompletedFlag => _isWorkCompletedFlag;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void changeStartDate(DateTime newDate) {
    _startDate = newDate;
    notifyListeners();
  }

  void setWorkEndDate(DateTime value) {
    _endDate = value;
    notifyListeners();
  }

  void setUpdateWorkStatus(String value) {
    _workStatus = value;
    notifyListeners();
  }

  void workCompletedStatus(bool value) {
    _isWorkCompletedFlag = value;
    _endDate = DateTime.now();
    notifyListeners();
  }

  void initializeSelectedStaffs(List<CreateStaffModel> existingTeam) {
    _selectedStaffs.clear();
    notifyListeners();
  }

  void matchExistingTeamMember(List<CreateStaffModel> existingTeam) {
    _selectedStaffs.clear();

    for (var existingMember in existingTeam) {
      var matchingStaff = _allStaffs.firstWhere(
        (staff) => staff.staffId == existingMember.staffId,
        orElse: () => existingMember,
      );
      _selectedStaffs.add(matchingStaff);
      log(
        'Matched staff: ${matchingStaff.name} with ID: ${matchingStaff.staffId}',
      );
    }
    log('Matched ${_selectedStaffs.length} existing team members');
    notifyListeners();
  }

  // Fetch available staffs
  Future<void> fetchAvailableStaffs(BuildContext context) async {
    try {
      setLoading(true);

      final staffProvider = Provider.of<ViewStaffProvider>(
        context,
        listen: false,
      );
      await staffProvider.fetchStaffs();
      _allStaffs = staffProvider.viewStaffList;
      notifyListeners();
    } catch (error) {
      log("Update work provider :: Error while fetching staff list: $error");
    } finally {
      setLoading(false);
    }
  }

  // add/remove staff in a work
  void updateAssignedStaffs(CreateStaffModel staff) {
    var existingStaffIndex = _selectedStaffs.indexWhere(
      (selectedStaff) => selectedStaff.staffId == staff.staffId,
    );

    if (existingStaffIndex != -1) {
      _selectedStaffs.removeAt(existingStaffIndex);
      log('Removed staff: ${staff.name} with ID: ${staff.staffId}');
    } else {
      _selectedStaffs.add(staff);
      log('Added staff: ${staff.name} with ID: ${staff.staffId}');
    }
    notifyListeners();
  }

  bool isStaffSelected(CreateStaffModel staff) =>
      _selectedStaffs.contains(staff);

  // update work
  Future<void> updateWork({
    required String workId,
    required String title,
    String? description,
    required DateTime startDate,
    DateTime? endDate,
    required String status,
    required bool isWorkCompleted,
  }) async {
    try {
      setLoading(true);

      final assignedEmployees = _selectedStaffs.map((e) => e.toMap()).toList();

      await FirebaseFirestore.instance.collection('works').doc(workId).update({
        'workSiteName': title,
        'workDescription': description ?? '',
        'startDate': startDate,
        'endDate': endDate,
        'status': status,
        'assignedEmployeeList': assignedEmployees,
        'updatedAt': FieldValue.serverTimestamp(),
        'isWorkCompleted': isWorkCompleted,
      });

      log('Work updates successfully');
      notifyListeners();
      await Future.delayed(Duration(seconds: 2));
    } catch (error) {
      log('Error while updating work: $error');
    } finally {
      setLoading(false);
    }
  }

  // Clear data when leaving screen
  void clearData() {
    _selectedStaffs.clear();
    _allStaffs.clear();
    _startDate = null;
    _endDate = null;
    _workStatus = null;
  }
}
