// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restclient.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://5d42a6e2bc64f90014a56ca0.mockapi.io/api/v1/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<List<Task>> getTask() async {
    const Map<String, dynamic> _extra = <String, dynamic>{};
    final Map<String, dynamic> queryParameters = <String, dynamic>{};
    final Map<String, dynamic> _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request<List<dynamic>>('/tasks',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => Task.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<Task> getTaskById(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('tasks/$id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Task.fromJson(_result.data);
    return value;
  }

  @override
  Future<List<Task>> getTasks() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('/tasks',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => Task.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<void> deleteTask(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    await _dio.request<void>('tasks/{id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'DELETE',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    return null;
  }

  @override
  Future<Task> updateTask(id, task) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(task, 'task');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = task;
    final _result = await _dio.request<Map<String, dynamic>>('tasks/$id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PUT',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Task.fromJson(_result.data);
    return value;
  }

  @override
  Future<Task> createTask(task) async {
    ArgumentError.checkNotNull(task, 'task');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = task;
    final _result = await _dio.request<Map<String, dynamic>>('/tasks',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final Task value = Task.fromJson(_result.data);
    return value;
  }

  @override
  Future<GenericCollection<Movie>> getMovies() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'popular?api_key=095a1beb261c7c8385ebb67348b42df7',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GenericCollection<Movie>.fromJson(_result.data);
    return value;
  }

  @override
  Future<MovieDetail> getDetailMovie(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '$id?api_key=095a1beb261c7c8385ebb67348b42df7',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = MovieDetail.fromJson(_result.data);
    return value;
  }
}
