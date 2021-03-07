import 'package:json_annotation/json_annotation.dart';

part 'g/coordinates.g.dart';
@JsonSerializable()
class Coordinates {
  final String latitude;
  final String longitude;

  Coordinates({this.latitude, this.longitude});

  factory Coordinates.fromJson(Map<String, dynamic> js) => _$CoordinatesFromJson(js);
}
