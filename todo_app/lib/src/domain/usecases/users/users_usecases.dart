import 'package:injectable/injectable.dart';
import 'package:todo_app/src/domain/usecases/users/get_user_by_id_usecase.dart';
@Injectable()
class UsersUseCases {
  GetUserByIdUseCase getUserById;

  UsersUseCases({required this.getUserById});
}