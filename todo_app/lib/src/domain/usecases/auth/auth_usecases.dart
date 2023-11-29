import 'package:todo_app/src/domain/usecases/auth/login_usecase.dart';
import 'package:todo_app/src/domain/usecases/auth/register_usecase.dart';
import 'package:todo_app/src/domain/usecases/auth/user_session_usecase.dart';

class AuthUseCases {

  LoginUseCase login;
  RegisterUseCase register;
  UserSessionUseCase getUser;

  AuthUseCases({required this.login, required this.register, required this.getUser});
}