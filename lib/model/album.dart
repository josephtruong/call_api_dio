import 'package:json_annotation/json_annotation.dart';

part 'g/album.g.dart';

@JsonSerializable()
class Album {
  Album({this.userId, this.id, this.title, this.email});

  factory Album.fromJson(Map<String, dynamic> js) => _$AlbumFromJson(js);

  final int userId;
  final int id;
  final String title;
  final String email;

  Map<String, dynamic> toJson() => _$AlbumToJson(this);
}
