import 'package:call_api_dio/model/album.dart';

class Albums {
  List<Album> list = [];

  Albums.fromJson(var data) {
    for (var item in data) {
       list.add(Album.fromJson(item));
    }
  }
}
