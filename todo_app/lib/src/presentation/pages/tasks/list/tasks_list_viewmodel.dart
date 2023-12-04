import 'package:flutter/cupertino.dart';
import 'package:todo_app/src/domain/models/tasks/task_model.dart';
import 'package:todo_app/src/domain/models/tasks/task_status.dart';
import 'package:todo_app/src/domain/usecases/auth/auth_usecases.dart';
import 'package:todo_app/src/domain/usecases/tasks/task_usecases.dart';
import 'package:todo_app/src/domain/utils/resource.dart';

class TasksListViewModel extends ChangeNotifier {
  AuthUseCases _authUseCases;
  TaskUseCases _taskUseCases;

  final Map<int, bool> _translationTaskState = {};

  TasksListViewModel(this._authUseCases,this._taskUseCases);

  Stream<Resource<List<TaskModel>>> getTasks() {
    String idUser = _authUseCases.getUser.userSession?.uid ?? '';
    return _taskUseCases.getTasks.lauch(idUser);
  }

  deleteTask(String id) async{
    await _taskUseCases.deleteTask.launch(id);
    notifyListeners();
  }


  changeTaskStatus(String id, int index) async{
    await _taskUseCases.completedTask.launch(id, TaskStatus.completed);
    notifyListeners();
  }

  bool getTranslationTask(int index) => _translationTaskState[index] ?? false;

  void translate(int index) {
    _translationTaskState[index] = !(_translationTaskState[index] ?? false);
    notifyListeners();
  }


}