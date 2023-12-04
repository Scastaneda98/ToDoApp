import 'package:todo_app/src/domain/models/tasks/task_model.dart';
import 'package:todo_app/src/domain/models/tasks/task_status.dart';
import 'package:todo_app/src/presentation/utils/validation_item.dart';

class TaskCreateState {
  ValidationItem title;
  ValidationItem description;
  String idUser;
  String error;

  TaskCreateState({
    this.title = const ValidationItem(),
    this.description = const ValidationItem(),
    this.idUser = '',
    this.error = ''
  });

  bool isValid() {
    if(title.value.isEmpty ||
        title.error.isNotEmpty ||
        description.value.isEmpty ||
        description.error.isNotEmpty ||
        idUser.isEmpty
    ) {
      return false;
    }
    return true;
  }

  toTask() => TaskModel(idUser: idUser, title: title.value, description: description.value, status: TaskStatus.pending.status,date: getDate());

  TaskCreateState copyWith({
    ValidationItem? title,
    ValidationItem? description,
    String? idUser,
    String? error
  }) => TaskCreateState(
    title: title ?? this.title,
    description: description ?? this.description,
    idUser: idUser ?? this.idUser,
    error: error ?? this.error,
  );

  String getDate() {
    DateTime now = DateTime.now();
    String formattedDate = "${_twoDigits(now.day)}/${_twoDigits(now.month)}/${now.year}";
    return formattedDate;
  }

  String _twoDigits(int n) {
    if (n >= 10) {
      return "$n";
    }
    return "0$n";
  }
}