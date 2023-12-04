import 'package:injectable/injectable.dart';
import 'package:todo_app/src/domain/repository/auth/auth_repository.dart';

@Injectable()
class LoginUseCase {

  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  launch({required String email, required String password}) => _authRepository.login(email: email, password: password);
}