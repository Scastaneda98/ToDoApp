import 'package:flutter/foundation.dart';
import 'package:todo_app/src/domain/models/user/user_model.dart';
import 'package:todo_app/src/domain/usecases/auth/auth_usecases.dart';
import 'package:todo_app/src/domain/usecases/users/users_usecases.dart';
import 'package:todo_app/src/domain/utils/resource.dart';

class ProfileViewModel extends ChangeNotifier {
  final UsersUseCases _usersUseCases;
  final AuthUseCases _authUseCases;

  ProfileViewModel(this._usersUseCases, this._authUseCases){
    getUserById();
  }

  Stream<Resource<UserModel>> getUserById() {
    final id = _authUseCases.getUser.userSession?.uid ?? '';
    return _usersUseCases.getUserById.launch(id);
  }

  logout() async {
    await _authUseCases.logout.launch();
  }
}