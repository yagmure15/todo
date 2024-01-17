// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/auth/application/auth_cubit/auth_cubit.dart' as _i7;
import '../../features/auth/infrastructure/auth_repository.dart' as _i6;
import '../logger/log_it.dart' as _i5;
import '../module/api_client/api_client.dart' as _i3;
import '../module/injectable_module.dart' as _i8;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final injectableModule = _$InjectableModule();
  gh.lazySingleton<_i3.ApiClient>(() => _i3.ApiClient());
  gh.lazySingleton<_i4.FirebaseAuth>(() => injectableModule.firebaseAuth);
  gh.lazySingleton<_i5.LogIt>(() => _i5.LogIt());
  gh.lazySingleton<_i6.AuthRepository>(
      () => _i6.AuthRepository(gh<_i4.FirebaseAuth>()));
  gh.lazySingleton<_i7.AuthCubit>(
      () => _i7.AuthCubit(gh<_i6.AuthRepository>()));
  return getIt;
}

class _$InjectableModule extends _i8.InjectableModule {}
