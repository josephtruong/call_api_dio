import 'package:json_annotation/json_annotation.dart';

part 'g/coordinates.g.dart';
@JsonSerializable()
class Coordinates {

  Coordinates({this.latitude, this.longitude});

  factory Coordinates.fromJson(Map<String, dynamic> js) => _$CoordinatesFromJson(js);

  final String latitude;
  final String longitude;

}
