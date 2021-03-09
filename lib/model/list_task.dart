import 'package:call_api_dio/model/task.dart';

class ListTask {
  List<Task> tasks;
  String error;

  ListTask({this.tasks, this.error = ''});

  ListTask.withError(String errorValue): error = errorValue, tasks = [];
}