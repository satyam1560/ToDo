// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'core/network/api_client.dart' as _i3;
import 'core/network/api_client_module.dart' as _i9;
import 'features/todo/data/datasources/todo_data_source.dart' as _i4;
import 'features/todo/data/repositories/todo_repo_impl.dart' as _i6;
import 'features/todo/domain/repositories/todo_repo.dart' as _i5;
import 'features/todo/domain/usecases/todo_usecase.dart' as _i7;
import 'features/todo/presentation/bloc/todo_bloc.dart' as _i8;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final apiClientModule = _$ApiClientModule();
    gh.singleton<_i3.ApiClient>(() => apiClientModule.apiClient());
    gh.factory<String>(
      () => apiClientModule.baseUrl,
      instanceName: 'baseUrl',
    );
    gh.singleton<_i4.TodoDataSource>(
        () => _i4.TodoDataSource(apiClient: gh<_i3.ApiClient>()));
    gh.lazySingleton<_i5.TodoRepo>(
        () => _i6.TodoRepoImpl(todoDataSource: gh<_i4.TodoDataSource>()));
    gh.lazySingleton<_i7.TodoUsecase>(
        () => _i7.TodoUsecase(todoRepo: gh<_i5.TodoRepo>()));
    gh.lazySingleton<_i8.TodoBloc>(
        () => _i8.TodoBloc(todoUsecase: gh<_i7.TodoUsecase>()));
    return this;
  }
}

class _$ApiClientModule extends _i9.ApiClientModule {}
