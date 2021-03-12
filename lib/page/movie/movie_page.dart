import 'package:call_api_dio/bloc/movie_bloc.dart';
import 'package:call_api_dio/page/movie/movie_detail.dart';
import 'package:flutter/material.dart';
import '../../model/movie.dart';

class MoviePage extends StatefulWidget {
  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  MovieBloc _movieBloc;

  @override
  void initState() {
    _movieBloc = MovieBloc();
    _movieBloc.getMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie'),
      ),
      body: StreamBuilder<List<Movie>>(
          stream: _movieBloc.movies,
          builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext ctx, int index) {
                    final Movie movie = snapshot.data[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (ctx){
                          return MovieDetailPage(id: movie.id.toString(),);
                        }));
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                height: 100,
                                width: 110,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(8.0),
                                        bottomLeft: Radius.circular(8.0)),
                                    image: DecorationImage(
                                       fit: BoxFit.cover,
                                        image: NetworkImage(
                                            'http://image.tmdb.org/t/p/w500${movie.posterPath}')))),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      movie.title,
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 18),
                                    ),
                                    const SizedBox(height: 4,),
                                    Text(
                                      movie.overview,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.justify,
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  });
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
