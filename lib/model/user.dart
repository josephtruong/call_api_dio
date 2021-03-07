import 'package:call_api_dio/model/geo.dart';
import 'package:call_api_dio/model/name.dart';
import 'package:call_api_dio/model/picture.dart';
import 'package:json_annotation/json_annotation.dart';
part 'g/user.g.dart';

@JsonSerializable()
class User {
  final String gender;
  final String email;
  final String phone;
  final Picture picture;
  final Name name;
  final Geo location;

  User({this.gender, this.email, this.phone, this.picture, this.name, this.location});

  factory User.fromJson(Map<String, dynamic> js) => _$UserFromJson(js);
}