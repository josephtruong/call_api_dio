import 'file:///E:/Flutter/call_api_dio/lib/provider/base_api.dart';
import 'package:call_api_dio/common/common.dart';
import 'package:call_api_dio/model/list_task.dart';
import 'package:call_api_dio/model/task.dart';
import 'package:rxdart/rxdart.dart';
import 'package:intl/intl.dart';

class TaskBloc extends BaseApi {
  final _tasks = BehaviorSubject<ListTask>();
  final _task = BehaviorSubject<Task>();

  Stream<ListTask> get tasks => _tasks?.stream;

  Stream<Task> get task => _task?.stream;

  TaskBloc() {
     _getTask();
   // _getAll();
  }

  _getAll() async {
    await Future.wait([_getTask(), getDetailTask(id: "9")]);
  }

  Future<dynamic> _getTask() async {
    try {
      final task = await restClient.getTask();
      _tasks?.sink?.add(ListTask(tasks: task));
    } catch (obj) {
      _tasks?.sink?.add(ListTask(error: handleError(obj)));
    }
  }

  Future<dynamic> getDetailTask({String id}) async {
    try {
      _task?.sink?.add(null);
      final result = await restClient.getTaskById(id);
      DateTime parseDate = new DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
          .parse(result.createdAt);
      var inputDate = DateTime.parse(parseDate.toString());
      var outputFormat = DateFormat('hh:mm a MM/dd/yyyy');
      var outputDate = outputFormat.format(inputDate);
      _task?.sink?.add(Task(
          name: result.name, avatar: result.avatar, createdAt: outputDate));
    } catch (error) {
      _task?.sink?.add(Task.withError(handleError(error)));
    }
  }

  deleteTasks({String id}) async {
    try {
      await restClient.deleteTask(id);
    } catch (err) {
      Common.showMessage(message: handleError(err));
    }
  }

  updateTask({String id, String name = 'Demo Task'}) async {
    try {
      await restClient.updateTask(id, Task(id: id, name: name));
    } catch (err) {
      Common.showMessage(message: handleError(err));
    }
  }

  onDispose() {
    _tasks?.close();
    _task?.close();
  }
}
