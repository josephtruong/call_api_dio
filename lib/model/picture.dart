import 'package:json_annotation/json_annotation.dart';
part 'g/picture.g.dart';

@JsonSerializable()
class Picture {
  final String large;
  final String medium;
  final String thumbnail;

  Picture({this.large, this.medium, this.thumbnail});

  factory Picture.fromJson(Map<String, dynamic> js) => _$PictureFromJson(js);
}