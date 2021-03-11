import 'package:call_api_dio/model/info.dart';
import 'package:call_api_dio/model/task.dart';
import 'package:call_api_dio/model/user.dart';
import 'package:json_annotation/json_annotation.dart';

// part 'response.g.dart';
//
// @JsonSerializable(createToJson: false)
class BaseResponseBody<T> {
  @JsonKey(fromJson: _dataFromJson)
  final T results;

  final Info info;

  BaseResponseBody({this.info, this.results});

  static T _dataFromJson<T>(Object js) {
    if (js is Map<String, dynamic>) {
      if (js.containsKey('email')) {
        return User.fromJson(js) as T;
      }

      if (js.containsKey('avatar')) {
        return Task.fromJson(js) as T;
      }

      if (js.containsKey('page')) {
        return Info.fromJson(js) as T;
      }
    } else if (js is List) {
      return js.map((e) => User.fromJson(e as Map<String, dynamic>)).toList()
          as T;
    }
    throw ArgumentError.value(
      js,
      'json',
      'Cannot convert the provided data.',
    );
  }
}
