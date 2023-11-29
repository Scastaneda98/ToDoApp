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
import 'package:todo_app/src/di/app_module.dart' as _i10;
import 'package:todo_app/src/di/firebase_service.dart' as _i7;
import 'package:todo_app/src/domain/repository/auth_repository.dart' as _i3;
import 'package:todo_app/src/domain/usecases/auth/auth_usecases.dart' as _i4;
import 'package:todo_app/src/domain/usecases/auth/register_usecase.dart' as _i8;
import 'package:todo_app/src/domain/usecases/auth/user_session_usecase.dart'
    as _i9;

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
    gh.factory<_i3.AuthRepository>(() => appModule.authRepository);
    gh.factory<_i4.AuthUseCases>(() => appModule.autUseCases);
    gh.factory<_i5.CollectionReference<Object?>>(
        () => appModule.usersReference);
    gh.factory<_i6.FirebaseAuth>(() => appModule.firebaseAuth);
    gh.factory<_i5.FirebaseFirestore>(() => appModule.firebaseFirestore);
    await gh.factoryAsync<_i7.FirebaseService>(
      () => appModule.firebaseService,
      preResolve: true,
    );
    gh.factory<_i8.RegisterUseCase>(
        () => _i8.RegisterUseCase(gh<_i3.AuthRepository>()));
    gh.factory<_i9.UserSessionUseCase>(
        () => _i9.UserSessionUseCase(gh<_i3.AuthRepository>()));
    return this;
  }
}

class _$AppModule extends _i10.AppModule {}
