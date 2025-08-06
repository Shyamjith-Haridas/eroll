import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eroll/features/create_staff/model/create_staff_model.dart';

class CreateWorkModel {
  String workId;
  String workSiteName;
  String workDescription;
  DateTime startDate;
  DateTime? endDate;
  List<Map<String, dynamic>> assignedEmployeesList;
  DateTime createdAt;
  DateTime? updatedAt;

  CreateWorkModel({
    required this.workId,
    required this.workSiteName,
    required this.workDescription,
    required this.startDate,
    this.endDate,
    required this.assignedEmployeesList,
    required this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'workId': workId,
      'workSiteName': workSiteName,
      'workDescription': workDescription,
      'startDate': startDate,
      'endDate': endDate,
      'assignedEmployeeList': assignedEmployeesList,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory CreateWorkModel.fromJson(Map<String, dynamic> map) {
    return CreateWorkModel(
      workId: map['workId'],
      workSiteName: map['workSiteName'],
      workDescription: map['workDescription'],
      startDate: (map['startDate'] as Timestamp).toDate(),
      endDate:
          map['endDate'] != null
              ? (map['endDate'] as Timestamp).toDate()
              : null,
      assignedEmployeesList: List<Map<String, dynamic>>.from(
        (map['assignedEmployeesList'] as List).map(
          (e) => Map<String, dynamic>.from(e),
        ),
      ),
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      updatedAt:
          map['updatedAt'] != null
              ? (map['updatedAt'] as Timestamp).toDate()
              : null,
    );
  }
}
