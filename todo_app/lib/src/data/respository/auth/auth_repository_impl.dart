import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app/src/core/constants.dart';
import 'package:todo_app/src/domain/models/user/user_model.dart';
import 'package:todo_app/src/domain/repository/auth/auth_repository.dart';
import 'package:todo_app/src/domain/utils/resource.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {

  final FirebaseAuth _firebaseAuth;
  final CollectionReference _usersReference;

  AuthRepositoryImpl(this._firebaseAuth, @Named(USERS) this._usersReference);

  @override
  Future<Resource> login({required String email, required String password}) async {
    try {
      UserCredential data = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return Success(data);
    } on FirebaseAuthException catch(exception) {
      return Failure(exception.message ?? 'Missing error');
    }
  }

  @override
  Future<Resource> register({required UserModel user}) async {
    try {
      UserCredential data = await _firebaseAuth.createUserWithEmailAndPassword(email: user.email, password: user.password);
      user.id = data.user?.uid ?? "";
      await _usersReference.doc(user.id).set(user.toJson());
      return Success(data);
    } on FirebaseAuthException catch(exception) {
      return Failure(exception.message ?? 'Missing error');
    }
  }

  @override
  User? get user => _firebaseAuth.currentUser;

  @override
  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }
}