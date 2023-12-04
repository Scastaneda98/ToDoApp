import 'package:todo_app/src/domain/models/user/user_model.dart';

import '../../utils/resource.dart';

abstract class UsersRepository {
  Stream<Resource<UserModel>> getUserById(String id);
}