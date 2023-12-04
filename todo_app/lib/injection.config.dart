// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:todo_app/src/data/respository/auth/auth_repository_impl.dart'
    as _i18;
import 'package:todo_app/src/data/respository/tasks/task_repository_impl.dart'
    as _i12;
import 'package:todo_app/src/data/respository/user/users_repository_impl.dart'
    as _i16;
import 'package:todo_app/src/di/app_module.dart' as _i24;
import 'package:todo_app/src/di/firebase_service.dart' as _i7;
import 'package:todo_app/src/domain/repository/auth/auth_repository.dart'
    as _i3;
import 'package:todo_app/src/domain/repository/tasks/task_repository.dart'
    as _i11;
import 'package:todo_app/src/domain/repository/user/users_repository.dart'
    as _i15;
import 'package:todo_app/src/domain/usecases/auth/auth_usecases.dart' as _i4;
import 'package:todo_app/src/domain/usecases/auth/login_usecase.dart' as _i8;
import 'package:todo_app/src/domain/usecases/auth/logout_usecase.dart' as _i9;
import 'package:todo_app/src/domain/usecases/auth/register_usecase.dart'
    as _i10;
import 'package:todo_app/src/domain/usecases/auth/user_session_usecase.dart'
    as _i14;
import 'package:todo_app/src/domain/usecases/tasks/completed_task_usecase.dart'
    as _i19;
import 'package:todo_app/src/domain/usecases/tasks/create_task_usecase.dart'
    as _i20;
import 'package:todo_app/src/domain/usecases/tasks/delete_task_usecase.dart'
    as _i21;
import 'package:todo_app/src/domain/usecases/tasks/get_tasks_usecase.dart'
    as _i22;
import 'package:todo_app/src/domain/usecases/tasks/task_usecases.dart' as _i13;
import 'package:todo_app/src/domain/usecases/users/get_user_by_id_usecase.dart'
    as _i23;
import 'package:todo_app/src/domain/usecases/users/users_usecases.dart' as _i17;

const String _Repositories = 'Repositories';
const String _UseCases = 'UseCases';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i3.AuthRepository>(
      () => appModule.authRepository,
      registerFor: {_Repositories},
    );
    gh.factory<_i4.AuthUseCases>(
      () => appModule.autUseCases,
      registerFor: {_UseCases},
    );
    gh.factory<_i5.CollectionReference<Object?>>(
      () => appModule.usersReference,
      instanceName: 'Users',
    );
    gh.factory<_i5.CollectionReference<Object?>>(
      () => appModule.tasksReference,
      instanceName: 'Tasks',
    );
    gh.factory<_i6.FirebaseAuth>(() => appModule.firebaseAuth);
    gh.factory<_i5.FirebaseFirestore>(() => appModule.firebaseFirestore);
    await gh.factoryAsync<_i7.FirebaseService>(
      () => appModule.firebaseService,
      preResolve: true,
    );
    gh.factory<_i8.LoginUseCase>(
        () => _i8.LoginUseCase(gh<_i3.AuthRepository>()));
    gh.factory<_i9.LogoutUseCase>(
        () => _i9.LogoutUseCase(gh<_i3.AuthRepository>()));
    gh.factory<_i10.RegisterUseCase>(
        () => _i10.RegisterUseCase(gh<_i3.AuthRepository>()));
    gh.factory<_i11.TaskRepository>(
      () => appModule.taskRepository,
      registerFor: {_Repositories},
    );
    gh.factory<_i11.TaskRepository>(() => _i12.TaskRepositoryImpl(
        gh<_i5.CollectionReference<Object?>>(instanceName: 'Tasks')));
    gh.factory<_i13.TaskUseCases>(
      () => appModule.taskUSeCases,
      registerFor: {_UseCases},
    );
    gh.factory<_i14.UserSessionUseCase>(
        () => _i14.UserSessionUseCase(gh<_i3.AuthRepository>()));
    gh.factory<_i15.UsersRepository>(
      () => appModule.usersRepository,
      registerFor: {_Repositories},
    );
    gh.factory<_i15.UsersRepository>(() => _i16.UsersRepositoryImpl(
        gh<_i5.CollectionReference<Object?>>(instanceName: 'Users')));
    gh.factory<_i17.UsersUseCases>(
      () => appModule.userUSeCases,
      registerFor: {_UseCases},
    );
    gh.factory<_i3.AuthRepository>(() => _i18.AuthRepositoryImpl(
          gh<_i6.FirebaseAuth>(),
          gh<_i5.CollectionReference<Object?>>(instanceName: 'Users'),
        ));
    gh.factory<_i4.AuthUseCases>(() => _i4.AuthUseCases(
          login: gh<_i8.LoginUseCase>(),
          register: gh<_i10.RegisterUseCase>(),
          getUser: gh<_i14.UserSessionUseCase>(),
          logout: gh<_i9.LogoutUseCase>(),
        ));
    gh.factory<_i19.CompletedTaskUseCase>(
        () => _i19.CompletedTaskUseCase(gh<_i11.TaskRepository>()));
    gh.factory<_i20.CreateTaskUseCase>(
        () => _i20.CreateTaskUseCase(gh<_i11.TaskRepository>()));
    gh.factory<_i21.DeleteTaskUseCase>(
        () => _i21.DeleteTaskUseCase(gh<_i11.TaskRepository>()));
    gh.factory<_i22.GetTasksUseCase>(
        () => _i22.GetTasksUseCase(gh<_i11.TaskRepository>()));
    gh.factory<_i23.GetUserByIdUseCase>(
        () => _i23.GetUserByIdUseCase(gh<_i15.UsersRepository>()));
    gh.factory<_i13.TaskUseCases>(() => _i13.TaskUseCases(
          createTask: gh<_i20.CreateTaskUseCase>(),
          getTasks: gh<_i22.GetTasksUseCase>(),
          deleteTask: gh<_i21.DeleteTaskUseCase>(),
          completedTask: gh<_i19.CompletedTaskUseCase>(),
        ));
    gh.factory<_i17.UsersUseCases>(
        () => _i17.UsersUseCases(getUserById: gh<_i23.GetUserByIdUseCase>()));
    return this;
  }
}

class _$AppModule extends _i24.AppModule {}
