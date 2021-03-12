import 'package:call_api_dio/model/response.dart';
import 'package:call_api_dio/model/user.dart';
import 'package:call_api_dio/provider/base_provider.dart';
import 'package:dio/dio.dart';

class UserApiProvider extends BaseApiProvider {
  UserApiProvider() {
    apiProvider ??= BaseApiProvider();
  }

  Future<BaseResponseBody<User>> getUsers({int page}) async {
    // try {
    //   final Response response = await dio.get(baseUrl + '?results=15&page=$page');
    //   print('============> 123 ${response.data['info']}');
    //   return BaseResponseBody(
    //       info: response.data['info'], results: response.data['results']);
    // } catch (error, stacktrace) {
    //   print('Exception occured: $error stackTrace: $stacktrace');
    //   // return UserResponse.withError(_handleError(error));
    // }
  }

  String _handleError(Exception error) {
    String errorDescription = '';
    if (error is DioError) {
      final DioError dioError = error;
      switch (dioError.type) {
        case DioErrorType.CANCEL:
          errorDescription = 'Request to API server was cancelled';
          break;
        case DioErrorType.CONNECT_TIMEOUT:
          errorDescription = 'Connection timeout with API server';
          break;
        case DioErrorType.DEFAULT:
          errorDescription =
              'Connection to API server failed due to internet connection';
          break;
        case DioErrorType.RECEIVE_TIMEOUT:
          errorDescription = 'Receive timeout in connection with API server';
          break;
        case DioErrorType.RESPONSE:
          errorDescription =
              'Received invalid status code: ${dioError.response.statusCode}';
          break;
        case DioErrorType.SEND_TIMEOUT:
          errorDescription = 'Send timeout in connection with API server';
          break;
      }
    } else {
      errorDescription = 'Unexpected error occured';
    }
    return errorDescription;
  }
}
