// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:task/data/data_source/task_local.dart' as _i927;
import 'package:task/data/repo/task_repo.dart' as _i44;
import 'package:task/domain/repo/task_repo.dart' as _i214;
import 'package:task/domain/use_case/add_task.dart' as _i1020;
import 'package:task/domain/use_case/delete_task.dart' as _i138;
import 'package:task/domain/use_case/get_all_task.dart' as _i271;
import 'package:task/domain/use_case/update_task.dart' as _i527;
import 'package:task/presentation/cubits/navigation/navigation_cubit.dart'
    as _i32;
import 'package:task/presentation/cubits/task/task_add_cubit.dart' as _i1048;
import 'package:task/presentation/cubits/task/task_delete_cubit.dart' as _i68;
import 'package:task/presentation/cubits/task/task_list_cubit.dart' as _i338;
import 'package:task/presentation/cubits/task/task_update_cubit.dart' as _i610;

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
    gh.factory<_i32.NavigationCubit>(() => _i32.NavigationCubit());
    gh.lazySingleton<_i927.TaskLocalDataSource>(
        () => _i927.TaskLocalDataSourceImpl());
    gh.lazySingleton<_i214.TaskRepo>(
        () => _i44.TaskRepoImpl(gh<_i927.TaskLocalDataSource>()));
    gh.lazySingleton<_i1020.AddTaskUseCase>(
        () => _i1020.AddTaskUseCase(gh<_i214.TaskRepo>()));
    gh.lazySingleton<_i138.DeleteTaskUseCase>(
        () => _i138.DeleteTaskUseCase(gh<_i214.TaskRepo>()));
    gh.lazySingleton<_i271.GetAllTaskUseCase>(
        () => _i271.GetAllTaskUseCase(gh<_i214.TaskRepo>()));
    gh.lazySingleton<_i527.UpdateTaskUseCase>(
        () => _i527.UpdateTaskUseCase(gh<_i214.TaskRepo>()));
    gh.factory<_i1048.TaskAddCubit>(
        () => _i1048.TaskAddCubit(gh<_i1020.AddTaskUseCase>()));
    gh.factory<_i338.TaskListCubit>(
        () => _i338.TaskListCubit(gh<_i271.GetAllTaskUseCase>()));
    gh.factory<_i68.TaskDeleteCubit>(
        () => _i68.TaskDeleteCubit(gh<_i138.DeleteTaskUseCase>()));
    gh.factory<_i610.TaskUpdateCubit>(
        () => _i610.TaskUpdateCubit(gh<_i527.UpdateTaskUseCase>()));
    return this;
  }
}
