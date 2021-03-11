import 'package:retrofit/http.dart';

import '../model/task.dart';

abstract class TaskRestClient {
  @GET('/tasks')
  Future<List<Task>> getTask();

  @GET('tasks/{id}')
  Future<Task> getTaskById(@Path('id') String id);

  @GET('/tasks')
  Future<List<Task>> getTasks();

}

class _TaskRestClient implements TaskRestClient {
  @override
  Future<List<Task>> getTask() {
    // TODO: implement getTask
    throw UnimplementedError();
  }

  @override
  Future<Task> getTaskById(String id) {
    // TODO: implement getTaskById
    throw UnimplementedError();
  }

  @override
  Future<List<Task>> getTasks() {
    // TODO: implement getTasks
    throw UnimplementedError();
  }

}