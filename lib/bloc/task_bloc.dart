import 'package:call_api_dio/common/common.dart';
import 'package:call_api_dio/model/list_task.dart';
import 'package:call_api_dio/model/task.dart';
import 'package:call_api_dio/provider/restclient.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:intl/intl.dart';

class TaskBloc {
  TaskBloc() {
    final Dio dio = Dio();
    dio.options = BaseOptions(
      contentType: 'application/json',
    );

    final BehaviorSubject<ListTask> _tasks = BehaviorSubject<ListTask>();
    final BehaviorSubject<Task> _task = BehaviorSubject<Task>();

    Stream<ListTask> get tasks => _tasks?.stream;

    Stream<Task> get task => _task?.stream;


    RestClient restClient;


    // dio.interceptors.add(LoggingInterceptor());
    restClient = RestClient(dio);
    _getTask();
    // _getAll();
  }

  Future<void> _getAll() async {
    await Future.wait([_getTask(), getDetailTask(id: '9')]);
  }

  Future<List<Task>> _getTask() async {
    try {
      final List<Task> task = await restClient.getTask();
      _tasks?.sink?.add(ListTask(tasks: task));
    } catch (obj) {
      // _tasks?.sink?.add(ListTask(error: handleError(obj)));
    }
  }

  Future<dynamic> getDetailTask({String id}) async {
    try {
      _task?.sink?.add(null);
      final Task result = await restClient.getTaskById(id);
      final DateTime parseDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
          .parse(result.createdAt);
      final DateTime inputDate = DateTime.parse(parseDate.toString());
      final DateFormat outputFormat = DateFormat('hh:mm a MM/dd/yyyy');
      final String outputDate = outputFormat.format(inputDate);
      _task?.sink?.add(Task(
          name: result.name, avatar: result.avatar, createdAt: outputDate));
    } catch (error) {
      //  _task?.sink?.add(Task.withError(handleError(error)));
    }
  }

  Future<void> deleteTasks({String id}) async {
    try {
      await restClient.deleteTask(id);
    } catch (err) {
      // Common.showMessage(message: handleError(err));
    }
  }

  Future<Task> updateTask({String id, String name = 'Demo Task'}) async {
    try {
      return await restClient.updateTask(id, Task(id: id, name: name));
    } catch (err) {
      // Common.showMessage(message: handleError(err));
      return null;
    }
  }

  Future<void> onDispose() {
    _tasks?.close();
    _task?.close();
  }
}
