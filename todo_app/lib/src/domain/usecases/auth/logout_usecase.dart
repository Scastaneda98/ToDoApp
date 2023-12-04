import 'package:injectable/injectable.dart';
import 'package:todo_app/src/domain/repository/auth/auth_repository.dart';

@Injectable()
class LogoutUseCase {
  final AuthRepository _repository;

  LogoutUseCase(this._repository);

  launch() => _repository.logout();
}