import 'package:injectable/injectable.dart';
import 'package:todo_app/src/domain/models/user/user_model.dart';
import 'package:todo_app/src/domain/repository/auth/auth_repository.dart';
@Injectable()
class RegisterUseCase {
  final AuthRepository _repository;

  RegisterUseCase(this._repository);

  launch(UserModel user) => _repository.register(user: user);
}