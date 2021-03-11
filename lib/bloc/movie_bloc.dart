import 'dart:async';

import 'package:call_api_dio/model/movie_detail.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

import '../common/common.dart';
import '../error.dart';
import '../model/movie.dart';
import '../provider/restclient.dart';
import '../repository/interceptors.dart';

class MovieBloc {
  final _movies = BehaviorSubject<List<Movie>>();
  final _movie = BehaviorSubject<MovieDetail>();

  Stream<List<Movie>> get movies => _movies?.stream;

  Stream<MovieDetail> get movie => _movie?.stream;

  RestClient _restClient;
  Dio _dio;

  MovieBloc() {
    _dio = Dio();
    _dio.interceptors.add(LoggingInterceptor());
    _restClient =
        RestClient(_dio, baseUrl: 'https://api.themoviedb.org/3/movie/');
  }

  getMovies() async {
    try {
      final data = await _restClient.getMovies();
      _movies?.sink?.add(data.results);
    } catch (e) {
      Common.showMessage(message: _handleError(e));
    }
  }

  getMovieDetail({String id}) async {
    try {
      final data = await _restClient.getDetailMovie(id);
      _movie?.sink?.add(data);
    } catch (e) {
      _movie?.sink?.add(MovieDetail.withError(_handleError(e)));
    }
  }

  String _handleError(Exception error) {
    String errorDescription = "";
    if (error is DioError) {
      DioError dioError = error;
      switch (dioError.type) {
        case DioErrorType.CANCEL:
          errorDescription = "Request to API server was cancelled";
          break;
        case DioErrorType.CONNECT_TIMEOUT:
          errorDescription = "Connection timeout with API server";
          break;
        case DioErrorType.DEFAULT:
          errorDescription =
              "Connection to API server failed due to internet connection";
          break;
        case DioErrorType.RECEIVE_TIMEOUT:
          errorDescription = "Receive timeout in connection with API server";
          break;
        case DioErrorType.RESPONSE:
          errorDescription =
              "Received invalid status code: ${dioError.response.statusCode}";
          break;
        case DioErrorType.SEND_TIMEOUT:
          errorDescription = "Send timeout in connection with API server";
          break;
      }
    } else {
      errorDescription = "Unexpected error occured";
    }
    return errorDescription;
  }

  onDispose() {
    _movies?.close();
    _movie?.close();
  }
}
