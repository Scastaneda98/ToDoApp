import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/src/domain/models/user/user_model.dart';
import 'package:todo_app/src/domain/utils/resource.dart';

abstract class AuthRepository {

  User? get user;
  Future<Resource> login({required String email, required String password});
  Future<Resource> register({required UserModel user});
  Future<void> logout();
}