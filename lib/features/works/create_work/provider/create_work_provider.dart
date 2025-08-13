import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eroll/features/create_staff/model/create_staff_model.dart';
import 'package:eroll/features/staffs/provider/view_staff_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../model/create_work_model.dart';

class CreateWorkProvider extends ChangeNotifier {
  bool _isLoading = false;
  List<CreateStaffModel> _staffsList = [];
  final List<CreateStaffModel> _selectedTeamMember = [];
  DateTime? _startDate;

  bool get isLoading => _isLoading;

  List<CreateStaffModel> get staffsList => _staffsList;

  List<CreateStaffModel> get selectedTeamMember => _selectedTeamMember;

  DateTime? get startDate => _startDate;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void setStartDate(DateTime value) {
    _startDate = value;
    notifyListeners();
  }

  // Create work
  Future<void> createWork({
    required String workSiteName,
    String? workDescription,
    required DateTime startDate,
    DateTime? endDate,
    required List<CreateStaffModel> teamMembers,
  }) async {
    try {
      setLoading(true);

      final firebase = FirebaseFirestore.instance.collection('works');
      final docRef = firebase.doc();

      final assignedEmployees = teamMembers.map((e) => e.toMap()).toList();

      final work = CreateWorkModel(
        workId: docRef.id,
        workSiteName: workSiteName,
        workDescription: workDescription ?? '',
        startDate: startDate,
        endDate: endDate,
        assignedEmployeesList: assignedEmployees,
        createdAt: DateTime.now(),
        updatedAt: null,
      );

      await docRef.set(work.toJson());
      log('work added with id: ${docRef.id}');
      notifyListeners();
      await Future.delayed(Duration(seconds: 2));
    } catch (error) {
      log('Error while creating work: $error');
    } finally {
      setLoading(false);
    }
  }

  // Fetch staff - add team
  Future<void> fetchStaffs(BuildContext context) async {
    try {
      setLoading(true);
      final staffProvider = Provider.of<ViewStaffProvider>(
        context,
        listen: false,
      );
      await staffProvider.fetchStaffs();
      _staffsList = staffProvider.viewStaffList;

      _selectedTeamMember.clear();
      notifyListeners();
    } catch (error) {
      log('Create Work Provider :: Error while fetching staff list: $error');
    } finally {
      setLoading(false);
    }
  }

  // Select staff
  void selectStaffMember(CreateStaffModel staffModel) {
    if (_selectedTeamMember.contains(staffModel)) {
      _selectedTeamMember.remove(staffModel);
    } else {
      _selectedTeamMember.add(staffModel);
    }
    notifyListeners();
  }

  bool isStaffMemberSelected(CreateStaffModel staff) {
    return _selectedTeamMember.contains(staff);
  }
}
