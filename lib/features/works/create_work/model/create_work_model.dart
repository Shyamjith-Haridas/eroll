import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eroll/core/constants/enums.dart';

class CreateWorkModel {
  String workId;
  String workSiteName;
  String workDescription;
  DateTime startDate;
  DateTime? endDate;
  List<Map<String, dynamic>> assignedEmployeesList;
  DateTime createdAt;
  DateTime? updatedAt;
  WorkStatus status;
  bool isWorkCompleted;

  CreateWorkModel({
    required this.workId,
    required this.workSiteName,
    required this.workDescription,
    required this.startDate,
    this.endDate,
    required this.assignedEmployeesList,
    required this.createdAt,
    this.updatedAt,
    this.status = WorkStatus.pending,
    this.isWorkCompleted = false,
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
      'status': status.name,
      'isWorkCompleted': isWorkCompleted,
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
      assignedEmployeesList:
          map['assignedEmployeeList'] != null
              ? List<Map<String, dynamic>>.from(
                (map['assignedEmployeeList'] as List).map(
                  (e) => Map<String, dynamic>.from(e),
                ),
              )
              : [],

      createdAt: (map['createdAt'] as Timestamp).toDate(),
      updatedAt:
          map['updatedAt'] != null
              ? (map['updatedAt'] as Timestamp).toDate()
              : null,
      status: WorkStatus.values.firstWhere(
        (element) => element.name == map['status'],
        orElse: () => WorkStatus.pending,
      ),
      isWorkCompleted: map['isWorkCompleted'],
    );
  }
}
