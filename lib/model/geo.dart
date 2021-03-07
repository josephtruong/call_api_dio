import 'package:call_api_dio/model/coordinates.dart';
import 'package:call_api_dio/model/street.dart';
import 'package:json_annotation/json_annotation.dart';
part 'g/geo.g.dart';

@JsonSerializable()
class Geo {
   final String city;
   final String country;
   final Street street;
   final Coordinates coordinates;

  Geo({this.city, this.country, this.street, this.coordinates});

  factory Geo.fromJson(Map<String, dynamic> js) => _$GeoFromJson(js);
}