import 'package:call_api_dio/bloc/movie_bloc.dart';
import 'package:call_api_dio/model/movie_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class MovieDetailPage extends StatefulWidget {
  final String id;

  const MovieDetailPage({Key key, this.id}) : super(key: key);

  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetailPage> {
  MovieBloc _movieBloc;

  @override
  void initState() {
    _movieBloc = MovieBloc();
    _movieBloc.getMovieDetail(id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<MovieDetail>(
        stream: _movieBloc.movie,
        builder: (ctx, snap) {
          if (snap.hasData) {
            if (snap.data.error != null) {
              return Center(
                child: Text(snap.data.error),
              );
            }
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.network(
                        'http://image.tmdb.org/t/p/w500${snap.data.posterPath}',
                        height: MediaQuery.of(context).size.height * 0.55,
                        fit: BoxFit.fitWidth,
                        width: MediaQuery.of(context).size.width,
                      ),
                      Positioned(
                          top: 36,
                          left: 12,
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey[100], shape: BoxShape.circle),
                              child: BackButton(
                                color: Colors.red,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ))),
                      Positioned(
                          top: 48,
                          right: 12,
                          child: Icon(Icons.favorite_border_outlined, color: Colors.red,)),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(snap.data.title, style: TextStyle(color: Colors.black, fontSize: 16),),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(children: [
                    Icon(Icons.star, color: Colors.yellow,),
                    Text(snap.data.voteAverage.toString())
                  ],),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(children: [
                    Text('${snap.data.voteCount} Vote')
                  ],),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(snap.data.overview),
                  _buildGenres(snap)
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Container _buildGenres(AsyncSnapshot<MovieDetail> snap) {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 12),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: snap.data.genres.length,
          itemBuilder: (ctx, index) {
            return Card(
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Center(child: Text(snap.data.genres[index].name)),
              ),
            );
          }),
    );
  }
}
