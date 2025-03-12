// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:task/presentation/cubits/home/home_tab_cubit.dart' as _i873;
import 'package:task/presentation/cubits/navigation/navigation_cubit.dart'
    as _i32;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i873.HomeTabCubit>(() => _i873.HomeTabCubit());
    gh.factory<_i32.NavigationCubit>(() => _i32.NavigationCubit());
    return this;
  }
}
