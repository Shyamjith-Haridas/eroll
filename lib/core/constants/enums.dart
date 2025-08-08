enum WorkStatus { pending, inProgress, completed }

extension WorkStatusExtension on WorkStatus {
  String get label {
    switch (this) {
      case WorkStatus.pending:
        return 'Pending';
      case WorkStatus.inProgress:
        return 'In Progress';
      case WorkStatus.completed:
        return 'Completed';
    }
  }

  static WorkStatus fromString(String value) {
    switch (value.toLowerCase()) {
      case 'pending':
        return WorkStatus.pending;
      case 'in progress':
        return WorkStatus.inProgress;
      case 'completed':
        return WorkStatus.completed;
      default:
        return WorkStatus.pending;
    }
  }
}
