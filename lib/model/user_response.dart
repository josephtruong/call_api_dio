import 'package:call_api_dio/model/info.dart';
import 'package:call_api_dio/model/user.dart';

class UserResponse {
  final List<User> results;
  final String error;
  Info info;

  UserResponse(this.results, this.info, this.error);

  // UserResponse.fromJson(Map<String, dynamic> js)
  //     : results = (js['results'] as List).map((i) => User.fromJson(i)).toList(),
  //       error = "";

  factory UserResponse.fromJson(Map<String, dynamic> js) {
    final info = Info.fromJson(js['info']);
    return UserResponse(
        (js['results'] as List).map((i) => User.fromJson(i)).toList(),
        info,
        '');
  }

  UserResponse.withError(String errorValue)
      : results = [],
        info = null,
        error = errorValue;
}
