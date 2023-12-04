import 'package:flutter/material.dart';
import 'package:todo_app/src/domain/usecases/auth/auth_usecases.dart';
import 'package:todo_app/src/domain/utils/resource.dart';
import 'package:todo_app/src/presentation/pages/auth/register/register_state.dart';
import 'package:todo_app/src/presentation/utils/validation_item.dart';

class RegisterViewModel extends ChangeNotifier{
  RegisterState _state = RegisterState();
  RegisterState get state => _state;
  Resource _response = Init();
  Resource get response => _response;

  final AuthUseCases _authUseCases;

  RegisterViewModel(this._authUseCases);

  void changeUsername(String value) {
    if(value.length >= 3) {
      _state = _state.copyWith(username: ValidationItem(value: value, error: ''));
    } else {
      _state = _state.copyWith(username: const ValidationItem(error: 'At least 3 characters are needed'));
    }
    notifyListeners();
  }

  void changeEmail(String value) {
    final bool emailFormatValid = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(value);
    if(!emailFormatValid) {
      _state = _state.copyWith(email: const ValidationItem(error: 'Email format invalid'));
    } else if(value.length >= 6) {
      _state = _state.copyWith(email: ValidationItem(value: value, error: ''));
    } else {
      _state = _state.copyWith(email: const ValidationItem(error: 'At least 6 characters are needed'));
    }
    notifyListeners();
  }

  void changePassword(String value) {
    if(value.length >= 8) {
      _state = _state.copyWith(password: ValidationItem(value: value, error: ''));
    } else {
      _state = _state.copyWith(password: const ValidationItem(error: 'At least 8 characters are needed'));
    }
    notifyListeners();
  }

  void changeConfirmPassword(String value) {
    if(value != _state.password.value) {
      _state = _state.copyWith(confirmPassword: const ValidationItem(error: 'Passwords do not match'));
    } else if(value.length >= 8) {
      _state = _state.copyWith(confirmPassword: ValidationItem(value: value, error: ''));
    } else {
      _state = _state.copyWith(confirmPassword: const ValidationItem(error: 'At least 8 characters are needed'));
    }
    notifyListeners();
  }

  register() async {
    if(_state.isValid()) {
      _response = Loading();
      notifyListeners();
      _response = await _authUseCases.register.launch(_state.toUser());
      notifyListeners();
    }
  }

  resetResponse() {
    _response = Init();
    notifyListeners();
  }
}