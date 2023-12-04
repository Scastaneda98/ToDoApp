import 'package:flutter/cupertino.dart';
import 'package:todo_app/src/domain/models/tasks/task_model.dart';
import 'package:todo_app/src/domain/usecases/auth/auth_usecases.dart';
import 'package:todo_app/src/domain/usecases/tasks/task_usecases.dart';
import 'package:todo_app/src/domain/utils/resource.dart';

class TasksListViewModel extends ChangeNotifier {
  AuthUseCases _authUseCases;
  TaskUseCases _taskUseCases;

  TasksListViewModel(this._authUseCases,this._taskUseCases);

  Stream<Resource<List<TaskModel>>> getTasks() {
    String idUser = _authUseCases.getUser.userSession?.uid ?? '';
    return _taskUseCases.getTasks.lauch(idUser);
  }
}