import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../constants/api_constant.dart';
import 'api_client.dart';
import '../../injectible.dart';

@module
abstract class ApiClientModule {
  @Named('baseUrl')
  String get baseUrl => APIConstants.baseUrl;

  @singleton
  ApiClient apiClient() {
    if (!getIt.isRegistered<Dio>()) {
      getIt.registerSingleton<Dio>(Dio());
    }
    final dioInstance = getIt<Dio>();
    dioInstance.options.baseUrl = baseUrl;
    // dioInstance.interceptors.add(AuthInterceptor());
    final apiClient = ApiClient(dioInstance, baseUrl: baseUrl);
    return apiClient;
  }
}
