enum TaskStatus {
  pending,
  completed,
  progress
}

extension TaskStatusExtension on TaskStatus {
  String get status {
    switch (this) {
      case TaskStatus.pending:
        return 'Pending';
      case TaskStatus.completed:
        return 'Completed';
      case TaskStatus.progress:
        return 'Progress';
    }
  }
}