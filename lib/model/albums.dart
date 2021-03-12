import 'package:call_api_dio/model/album.dart';

class Albums {
  Albums.fromJson(dynamic data) {
    for (final item in data) {
      list.add(Album.fromJson(item));
    }
  }
  List<Album> list = <Album>[];
}
