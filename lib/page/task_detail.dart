import 'package:call_api_dio/bloc/task_bloc.dart';
import 'package:call_api_dio/model/task.dart';
import 'package:flutter/material.dart';

class TaskDetailPage extends StatefulWidget {
  final TaskBloc taskBloc;
  final String id;

  const TaskDetailPage({Key key, this.taskBloc, this.id}) : super(key: key);

  @override
  _TaskDetailPageState createState() => _TaskDetailPageState();
}

class _TaskDetailPageState extends State<TaskDetailPage> {
  @override
  void initState() {
    super.initState();
    widget.taskBloc.getDetailTask(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: StreamBuilder<Task>(
        stream: widget.taskBloc.task,
        builder: (ctx, snap) {
          Task task = snap.data;
          if (snap.hasData) {
            if (snap.data.error != null) {
              return Center(
                child: Text(snap.data.error),
              );
            }
            return Container(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                //   Container(
                //     width: 100,
                //     height: 100,
                //     decoration: BoxDecoration(
                //       color: Colors.blue,
                //       image: DecorationImage(
                //          image: NetworkImage(task.avatar),
                //         // fit: BoxFit.cover
                //       )
                //     ),
                //   ),
                  Text(task.name),
                  Text(task.createdAt),
                ],
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
