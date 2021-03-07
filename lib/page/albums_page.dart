import 'package:call_api_dio/main.dart';
import 'package:call_api_dio/model/album.dart';
import 'package:call_api_dio/model/albums.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AlbumsPage extends StatefulWidget {
 final TYPE  type;

  const AlbumsPage({Key key, this.type}) : super(key: key);
  @override
  _AlbumsPageState createState() => _AlbumsPageState();
}

class _AlbumsPageState extends State<AlbumsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Albums'),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                createAlbum();
              })
        ],
      ),
      body: widget.type == TYPE.FEATURE ? _buildFutureBuilder() : Container(),
    );
  }

  FutureBuilder<List<Album>> _buildFutureBuilder() {
    return FutureBuilder<List<Album>>(
        future: fetchAlbum(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
                separatorBuilder: (ctx, index) => Divider(),
                itemCount: snapshot.data.length,
                itemBuilder: (ctx, index) {
                  Album album = snapshot.data[index];
                  return ListTile(
                    title: Text('${album.id}'),
                    subtitle: Text(album.title),
                  );
                });
          } else if (snapshot.hasError) {
            print('Get error -------> ${snapshot.error}');
            return Container(
              color: Colors.red,
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  Future<List<Album>> fetchAlbum() async {
    Dio dio = new Dio();
    final response =
        await dio.get('https://jsonplaceholder.typicode.com/albums');
    if (response.statusCode == 200) {
      return Albums.fromJson(response.data).list;
    } else {
      throw Exception('Failed to load album');
    }
  }


  createAlbum() async {
    Map<String, dynamic> body = {'title': 'Flutter dev'};
    Options options = Options(headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
    Dio dio = new Dio();
    final res = await dio.postUri(
        Uri.https('jsonplaceholder.typicode.com', 'albums'),
        data: body,
        options: options);
    if (res.statusCode == 201) {
      print('---------> ${res.data}');
    } else {
      throw Exception('Failed to load album');
    }
  }
}
