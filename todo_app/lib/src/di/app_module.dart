import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app/src/core/constants.dart';
import 'package:todo_app/src/data/respository/auth/auth_repository_impl.dart';
import 'package:todo_app/src/data/respository/tasks/task_repository_impl.dart';
import 'package:todo_app/src/data/respository/user/users_repository_impl.dart';
import 'package:todo_app/src/di/firebase_service.dart';
import 'package:todo_app/src/domain/repository/auth/auth_repository.dart';
import 'package:todo_app/src/domain/repository/user/users_repository.dart';
import 'package:todo_app/src/domain/repository/tasks/task_repository.dart';
import 'package:todo_app/src/domain/usecases/auth/auth_usecases.dart';
import 'package:todo_app/src/domain/usecases/auth/login_usecase.dart';
import 'package:todo_app/src/domain/usecases/auth/logout_usecase.dart';
import 'package:todo_app/src/domain/usecases/auth/register_usecase.dart';
import 'package:todo_app/src/domain/usecases/auth/user_session_usecase.dart';
import 'package:todo_app/src/domain/usecases/tasks/create_task_usecase.dart';
import 'package:todo_app/src/domain/usecases/tasks/get_tasks_usecase.dart';
import 'package:todo_app/src/domain/usecases/tasks/task_usecases.dart';
import 'package:todo_app/src/domain/usecases/users/get_user_by_id_usecase.dart';
import 'package:todo_app/src/domain/usecases/users/users_usecases.dart';

@module
abstract class AppModule {

  @preResolve
  Future<FirebaseService> get firebaseService => FirebaseService.init();

  @injectable
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  @injectable
  FirebaseFirestore get firebaseFirestore => FirebaseFirestore.instance;

  @Named(USERS)
  @injectable
  CollectionReference get usersReference => firebaseFirestore.collection(USERS);

  @Named(TASKS)
  @injectable
  CollectionReference get tasksReference => firebaseFirestore.collection(TASKS);

  @Environment(REPOSITORIES)
  @injectable
  AuthRepository get authRepository => AuthRepositoryImpl(firebaseAuth, usersReference);

  @Environment(REPOSITORIES)
  @injectable
  UsersRepository get usersRepository => UsersRepositoryImpl(usersReference);

  @Environment(REPOSITORIES)
  @injectable
  TaskRepository get taskRepository => TaskRepositoryImpl(tasksReference);

  @Environment(USE_CASES)
  @injectable
  AuthUseCases get autUseCases => AuthUseCases(
      login: LoginUseCase(authRepository),
      register: RegisterUseCase(authRepository),
      getUser: UserSessionUseCase(authRepository),
      logout: LogoutUseCase(authRepository)
  );

  @Environment(USE_CASES)
  @injectable
  UsersUseCases get userUSeCases => UsersUseCases(getUserById: GetUserByIdUseCase(usersRepository));

  @Environment(USE_CASES)
  @injectable
  TaskUseCases get taskUSeCases => TaskUseCases(
      createTask: CreateTaskUseCase(taskRepository),
      getTasks: GetTasksUseCase(taskRepository)
  );
}