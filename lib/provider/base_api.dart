import 'package:call_api_dio/provider/restclient.dart';
import 'package:call_api_dio/repository/interceptors.dart';
import 'package:dio/dio.dart';

abstract class BaseApi {
  RestClient restClient;

  BaseApi() {
    Dio dio = Dio();
    dio.options = BaseOptions(contentType: "application/json",);

    dio.interceptors.add(LoggingInterceptor());
    restClient = RestClient(dio);
  }

  String handleError(Exception error) {
    print(error.toString());
    String errorDescription = "Unexpected error occured";
    if (error is DioError) {
      DioError dioError = error;
      switch (dioError.type) {
        case DioErrorType.CANCEL:
          errorDescription = "Request to API server was cancelled";
          break;
        case DioErrorType.CONNECT_TIMEOUT:
          errorDescription = "Connection timeout with API server";
          break;
        case DioErrorType.DEFAULT:
          errorDescription =
              "Connection to API server failed due to internet connection";
          break;
        case DioErrorType.RECEIVE_TIMEOUT:
          errorDescription = "Receive timeout in connection with API server";
          break;
        case DioErrorType.RESPONSE:
          errorDescription =
              "Received invalid status code: ${dioError.response.statusCode}";
          break;
        case DioErrorType.SEND_TIMEOUT:
          errorDescription = "Send timeout in connection with API server";
          break;
      }
    } else {
      errorDescription = "Unexpected error occured";
    }
    return errorDescription;
  }
}
