import 'package:call_api_dio/bloc/task_bloc.dart';
import 'package:call_api_dio/model/list_task.dart';
import 'package:call_api_dio/model/task.dart';
import 'package:call_api_dio/page/task_detail.dart';
import 'package:call_api_dio/provider/restclient.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskPage extends StatefulWidget {
  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  TaskBloc _taskBloc;

  @override
  void initState() {
    _taskBloc = TaskBloc();
    super.initState();
  }

  getTask() async {
    final dio = Dio();
    final restClient = RestClient(dio);
    try {
      restClient.getTask();
    } catch (obj) {
      switch (obj.runtimeType) {
        case DioError:
          // Here's the sample to get the failed response error code and message
          final res = (obj as DioError).response;
          print("Got error : ${res.statusCode} -> ${res.statusMessage}");
          break;
        default:
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task'),
      ),
      body: StreamBuilder<ListTask>(
        stream: _taskBloc.tasks,
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.error.isNotEmpty) {
              return Center(
                child: Text(snapshot.data.error),
              );
            }
            return ListView.builder(
                itemCount: snapshot.data.tasks.length,
                itemBuilder: (ctx, index) {
                  final task = snapshot.data.tasks[index];
                  return ListTile(
                    title: Text(task?.name),
                    subtitle:
                        Text(task.createdAt != null ? parseData(task.createdAt) : ''),
                    onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                          return TaskDetailPage(taskBloc: _taskBloc, id: task.id,);
                        }));
                    },
                    onLongPress: () {
                     // _taskBloc.deleteTasks(id: task.id);
                      _taskBloc.updateTask(id: task.id);
                    },
                  );
                });
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('Task'),
    //   ),
    //   body: FutureBuilder<List<Task>>(
    //       initialData: [],
    //       future: restClient.getTask(),
    //       builder: (ctx, snapshot) {
    //         if (snapshot.hasData) {
    //           return ListView.builder(
    //               itemCount: snapshot.data.length,
    //               itemBuilder: (ctx, index) {
    //                 final task = snapshot.data[index];
    //                 return ListTile(
    //                   title: Text(task?.name),
    //                   subtitle:
    //                       Text(task.createdAt != null ? task.createdAt : ''),
    //                   onTap: () {
    //                     restClient
    //                         .getTaskById(task.id)
    //                         .then((value) => Navigator.push(context,
    //                                 MaterialPageRoute(builder: (ctx) {
    //                               return TaskDetailPage(
    //                                 task: value,
    //                               );
    //                             })))
    //                         .catchError((err) {
    //                       _handleError(err);
    //                     });
    //                   },
    //                 );
    //               });
    //         } else if (snapshot.hasError) {
    //           return Center(
    //             child: Text(_handleError(snapshot.error)),
    //           );
    //         }
    //         return CircularProgressIndicator();
    //       }),
    // );
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

  String parseData(String createdAt) {
    DateTime parseDate = new DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(createdAt);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('HH:mm:ss MM/dd/yyyy');
    return outputFormat.format(inputDate);
  }
}
