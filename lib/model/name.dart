import 'package:json_annotation/json_annotation.dart';
part 'g/name.g.dart';

@JsonSerializable()
class Name {
  final String title;
  final String first;
  final String last;

  Name({this.title, this.first, this.last});

  factory Name.fromJson(Map<String, dynamic> js) => _$NameFromJson(js);
}
