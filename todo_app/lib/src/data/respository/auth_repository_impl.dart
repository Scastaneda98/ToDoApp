import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/src/domain/models/user_model.dart';
import 'package:todo_app/src/domain/repository/auth_repository.dart';
import 'package:todo_app/src/domain/utils/resource.dart';

class AuthRepositoryImpl implements AuthRepository {

  FirebaseAuth _firebaseAuth;
  CollectionReference _usersReference;

  AuthRepositoryImpl(this._firebaseAuth, this._usersReference);

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
}