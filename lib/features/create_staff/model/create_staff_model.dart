import 'package:cloud_firestore/cloud_firestore.dart';

class CreateStaffModel {
  final String staffId;
  final String name;
  final String mobile;
  final String empType;
  final DateTime createdAt;

  CreateStaffModel({
    required this.staffId,
    required this.name,
    required this.mobile,
    required this.empType,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'staff_id': staffId,
      'name': name,
      'mobile': mobile,
      'emp_type': empType,
      'created_at': createdAt,
    };
  }

  factory CreateStaffModel.fromMap(Map<String, dynamic> map) {
    return CreateStaffModel(
      staffId: map['staff_id'] ?? '',
      name: map['name'] ?? '',
      mobile: map['mobile'] ?? '',
      empType: map['emp_type'] ?? '',
      createdAt: (map['created_at'] as Timestamp).toDate(),
    );
  }
}
