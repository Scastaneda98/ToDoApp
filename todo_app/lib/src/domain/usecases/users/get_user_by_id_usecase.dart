import 'package:injectable/injectable.dart';
import 'package:todo_app/src/domain/models/user/user_model.dart';
import 'package:todo_app/src/domain/repository/user/users_repository.dart';
import 'package:todo_app/src/domain/utils/resource.dart';
@Injectable()
class GetUserByIdUseCase {
  final UsersRepository _repository;

  GetUserByIdUseCase(this._repository);

  Stream<Resource<UserModel>> launch(String id) => _repository.getUserById(id);
}