import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app/src/data/respository/auth_repository_impl.dart';
import 'package:todo_app/src/di/firebase_service.dart';
import 'package:todo_app/src/domain/repository/auth_repository.dart';
import 'package:todo_app/src/domain/usecases/auth/auth_usecases.dart';
import 'package:todo_app/src/domain/usecases/auth/login_usecase.dart';
import 'package:todo_app/src/domain/usecases/auth/register_usecase.dart';
import 'package:todo_app/src/domain/usecases/auth/user_session_usecase.dart';

@module
abstract class AppModule {

  @preResolve
  Future<FirebaseService> get firebaseService => FirebaseService.init();

  @injectable
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  @injectable
  FirebaseFirestore get firebaseFirestore => FirebaseFirestore.instance;

  @injectable
  CollectionReference get usersReference => firebaseFirestore.collection("Users");

  @injectable
  AuthRepository get authRepository => AuthRepositoryImpl(firebaseAuth, usersReference);
  
  @injectable
  AuthUseCases get autUseCases => AuthUseCases(
      login: LoginUseCase(authRepository),
      register: RegisterUseCase(authRepository),
      getUser: UserSessionUseCase(authRepository)
  );
}