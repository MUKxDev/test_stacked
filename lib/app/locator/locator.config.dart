// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../services/auth_service.dart' as _i3;
import '../services/increment_service.dart' as _i4;
import '../services/router_service.dart' as _i5;
import '../services/todos_service.dart' as _i6;
import '../services/users_service.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.AuthService>(() => _i3.AuthService());
  gh.lazySingleton<_i4.IncrementService>(() => _i4.IncrementService());
  gh.lazySingleton<_i5.RouterService>(() => _i5.RouterService());
  gh.lazySingleton<_i6.TodosService>(() => _i6.TodosService());
  gh.lazySingleton<_i7.UsersService>(() => _i7.UsersService());
  return get;
}
