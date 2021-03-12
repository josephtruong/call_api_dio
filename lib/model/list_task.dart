import 'package:call_api_dio/model/task.dart';

class ListTask {
  ListTask({this.tasks, this.error = ''});

  ListTask.withError(String errorValue)
      : error = errorValue,
        tasks = [];

  List<Task> tasks;
  String error;
}
