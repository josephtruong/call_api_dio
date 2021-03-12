import 'package:call_api_dio/main.dart';
import 'package:call_api_dio/model/album.dart';
import 'package:call_api_dio/model/albums.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AlbumsPage extends StatefulWidget {
  const AlbumsPage({Key key, this.type}) : super(key: key);

  final TYPE type;

  @override
  _AlbumsPageState createState() => _AlbumsPageState();
}

class _AlbumsPageState extends State<AlbumsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Albums'),
        actions: [
          IconButton(
              icon: const Icon(Icons.add),
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
        builder: (BuildContext context, AsyncSnapshot<List<Album>> snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
                separatorBuilder: (BuildContext ctx, int index) =>
                    const Divider(),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext ctx, int index) {
                  final Album album = snapshot.data[index];
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
            return const Center(child: CircularProgressIndicator());
          }
        });
  }

  Future<List<Album>> fetchAlbum() async {
    final Dio dio = Dio();
    final Response<List<Album>> response =
        await dio.get('https://jsonplaceholder.typicode.com/albums');
    if (response.statusCode == 200) {
      return Albums.fromJson(response.data).list;
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<void> createAlbum() async {
    //ToDo
    final Map<String, String> body = {
      'title': 'Flutter dev',
      'body': 1.toString()
    };
    final Options options = Options(headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
    final Dio dio = Dio();
    final Response<Album> res = await dio.postUri(
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
