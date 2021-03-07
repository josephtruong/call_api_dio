import 'package:call_api_dio/model/info.dart';
import 'package:call_api_dio/model/user_response.dart';

abstract class BaseResponse {
  String error;
  Info info;

  BaseResponse(this.error, this.info);
}
