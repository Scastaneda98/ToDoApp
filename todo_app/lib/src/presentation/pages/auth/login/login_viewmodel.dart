import 'package:flutter/cupertino.dart';
import 'package:todo_app/src/domain/usecases/auth/auth_usecases.dart';
import 'package:todo_app/src/domain/utils/resource.dart';
import 'package:todo_app/src/presentation/pages/auth/login/login_state.dart';
import 'package:todo_app/src/presentation/utils/validation_item.dart';

class LoginViewModel extends ChangeNotifier {

  LoginState _state = LoginState();
  AuthUseCases _authUseCases;
  Resource _response = Init();

  LoginState get state => _state;
  Resource get response => _response;

  LoginViewModel(this._authUseCases) {
    final user = _authUseCases.getUser.userSession;
    if(user != null) {
      _response = Success(user);
    }
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
  
  void login() async {
    if(_state.isValid()) {
      _response = Loading();
      notifyListeners();
      _response = await _authUseCases.login.launch(email: _state.email.value, password: _state.password.value);
      notifyListeners();

      print('Data: ${_response}');
    } else {
      print('Invalido');
    }

  }

  resetResponse() {
    _response = Init();
    notifyListeners();
  }
}