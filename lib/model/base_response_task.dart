import 'package:json_annotation/json_annotation.dart';

class BaseResponseTask<T> {
  String error;
  T data;
  BaseResponseTask({this.error, this.data});

  factory BaseResponseTask.fromJson(Map<String, dynamic>  js) {
    return BaseResponseTask(error: '', data: null);
  }
}
