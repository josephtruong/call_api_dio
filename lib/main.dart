import 'package:call_api_dio/bloc/movie_bloc.dart';
import 'package:call_api_dio/page/movie/movie_page.dart';
import 'package:call_api_dio/page/task_page.dart';
import 'package:call_api_dio/page/users_page/user_page.dart';
import 'package:flutter/material.dart';

import 'page/albums_page.dart';

final GlobalKey<NavigatorState> navigatorKey =  GlobalKey<NavigatorState>();
//Create context for app use

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dio'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute<void>(builder: (BuildContext ctx) {
                    return const AlbumsPage(
                      type: TYPE.FEATURE,
                    );
                  }));
                },
                child: const Text('Call Api Feature')),
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute<void>(builder: (BuildContext ctx) {
                    return UserPage();
                  }));
                },
                child: const Text('Call Api Stream')),
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute<void>(builder: (BuildContext ctx) {
                    return TaskPage();
                  }));
                },
                child: const Text('Call Api Retrofit')),
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute<void>(builder: (BuildContext ctx) {
                    return MoviePage();
                  }));
                },
                child: const Text('Movie')),
          ],
        ),
      ),
    );
  }
}

enum TYPE { FEATURE, STREAM }
