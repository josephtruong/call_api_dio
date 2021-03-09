
import 'package:json_annotation/json_annotation.dart';

part 'g/task.g.dart';

@JsonSerializable()
class Task {
  String id;
  String name;
  String avatar;
  String createdAt;
  String error;

  Task({this.id, this.name, this.avatar, this.createdAt,this.error });

  Task.withError(String value): error = value;

  factory Task.fromJson(Map<String, dynamic> js) => _$TaskFromJson(js);
}
