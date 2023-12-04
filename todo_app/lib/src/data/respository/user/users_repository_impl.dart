import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app/src/core/constants.dart';
import 'package:todo_app/src/domain/models/user/user_model.dart';
import 'package:todo_app/src/domain/repository/user/users_repository.dart';
import 'package:todo_app/src/domain/utils/resource.dart';

@Injectable(as: UsersRepository)
class UsersRepositoryImpl implements UsersRepository {
  final CollectionReference _usersReference;

  UsersRepositoryImpl(@Named(USERS) this._usersReference);

  @override
  Stream<Resource<UserModel>> getUserById(String id) {
    try {
      final data = _usersReference.doc(id).snapshots(includeMetadataChanges: true);
      final dataMap = data.map((document) => Success(UserModel.fromJson(document.data() as Map<String, dynamic>)));
      return dataMap;
    } on FirebaseException catch(exception) {
      throw Failure(exception.message ?? 'Missing Error');
    }
  }
  
}
