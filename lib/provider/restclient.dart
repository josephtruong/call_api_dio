import 'package:call_api_dio/model/base/generic_collection.dart';
import 'package:call_api_dio/model/movie_detail.dart';
import 'package:call_api_dio/model/task.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:retrofit/http.dart';
import '../model/movie.dart';

part 'restclient.g.dart';

@RestApi(baseUrl: 'https://5d42a6e2bc64f90014a56ca0.mockapi.io/api/v1/')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/tasks')
  Future<List<Task>> getTask();

  @GET('tasks/{id}')
  Future<Task> getTaskById(@Path('id') String id);

  @GET('/tasks')
  Future<List<Task>> getTasks();

  @DELETE('tasks/{id')
  Future<void> deleteTask(@Path() String id);

  @PUT('tasks/{id}')
  Future<Task> updateTask(@Path() String id, @Body() Task task);

  @POST('/tasks')
  Future<Task> createTask(@Body() Task task);

  @GET('popular?api_key=095a1beb261c7c8385ebb67348b42df7')
  Future<GenericCollection<Movie>> getMovies();

  @GET('{id}?api_key=095a1beb261c7c8385ebb67348b42df7')
  Future<MovieDetail> getDetailMovie(@Path('id') String id);

}
