import 'package:call_api_dio/repository/interceptors.dart';
import 'package:dio/dio.dart';

BaseApiProvider apiProvider;

class BaseApiProvider {
  String baseUrl = 'https://randomuser.me/api';
  Dio dio;

  BaseApiProvider() {
    final options = BaseOptions(receiveTimeout: 5000, connectTimeout: 5000);
    dio = Dio(options);
    dio.interceptors.add(LoggingInterceptor());
  }
}
