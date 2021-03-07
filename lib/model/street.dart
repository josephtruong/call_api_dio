import 'package:json_annotation/json_annotation.dart';
part 'g/street.g.dart';

@JsonSerializable()
class Street {
  final int number;
  final String name;

  Street({this.number, this.name});

  factory Street.fromJson(Map<String, dynamic> js) => _$StreetFromJson(js);
}