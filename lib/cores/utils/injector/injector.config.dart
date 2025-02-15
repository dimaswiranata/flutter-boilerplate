// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:flutterboilerplate/cores/helpers/dio_helper.dart' as _i3;
import 'package:flutterboilerplate/cores/utils/modules/network_module.dart'
    as _i7;
import 'package:flutterboilerplate/cores/utils/modules/storage_module.dart'
    as _i8;
import 'package:flutterboilerplate/features/onboarding/presentation/bloc/onboarding_bloc.dart'
    as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i6;

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
    final networkModule = _$NetworkModule();
    final storageModule = _$StorageModule();
    gh.factory<_i3.DioHelper>(() => _i3.DioHelper());
    gh.factory<_i4.OnboardingBloc>(() => _i4.OnboardingBloc());
    gh.lazySingleton<_i5.Dio>(() => networkModule.dio);
    await gh.lazySingletonAsync<_i6.SharedPreferences>(
      () => storageModule.sharedPreference,
      preResolve: true,
    );
    return this;
  }
}

class _$NetworkModule extends _i7.NetworkModule {}

class _$StorageModule extends _i8.StorageModule {}
