import 'package:flutter/material.dart';
import 'package:todo_app/src/domain/usecases/auth/auth_usecases.dart';
import 'package:todo_app/src/domain/usecases/tasks/task_usecases.dart';
import 'package:todo_app/src/domain/utils/resource.dart';
import 'package:todo_app/src/presentation/pages/tasks/create/task_create_state.dart';
import 'package:todo_app/src/presentation/utils/validation_item.dart';

class TaskCreateViewModel extends ChangeNotifier {
  TaskCreateState _state = TaskCreateState();
  TaskCreateState get state => _state;

  final AuthUseCases _authUseCases;
  final TaskUseCases _taskUseCases;

  Resource _response = Init();
  Resource get response => _response;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  TaskCreateViewModel(this._authUseCases, this._taskUseCases);

  changeTitle(String value){
    if(value.length >= 3) {
      _state = _state.copyWith(title: ValidationItem(value: value,error: ''));
    } else {
      _state = _state.copyWith(title: const ValidationItem(error: 'At least 3 characters are needed'));
    }
    notifyListeners();
  }

  changeDescription(String value){
    if(value.length >= 6) {
      _state = _state.copyWith(description: ValidationItem(value: value,error: ''));
    } else {
      _state = _state.copyWith(description: const ValidationItem(error: 'At least 6 characters are needed'));
    }
    notifyListeners();
  }

  createTask() async{
    _state = _state.copyWith(idUser: _authUseCases.getUser.userSession?.uid ?? '');
    if(_state.isValid()){
      _response = Loading();
      notifyListeners();
      _response = await _taskUseCases.createTask.launch(_state.toTask());
      notifyListeners();
    } else {
      _state = _state.copyWith(error: 'Complete the form');
      notifyListeners();
    }
  }

  resetResponse() {
    _response = Init();
    notifyListeners();
  }

  resetState() {
    _state = TaskCreateState();
    titleController.clear();
    descriptionController.clear();
    notifyListeners();
  }
}