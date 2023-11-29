import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app/src/domain/repository/auth_repository.dart';

@Injectable()
class UserSessionUseCase {
  AuthRepository _repository;

  UserSessionUseCase(this._repository);

  User? get userSession => _repository.user;
}