import 'file:///F:/Flutter/ApiDio/call_api_dio/lib/page/albums_page.dart';
import 'package:call_api_dio/page/users_page/user_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        title: Text('Dio'),
      ),
      body: Container(
        child: Column(
          children: [
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                    return AlbumsPage(
                      type: TYPE.FEATURE,
                    );
                  }));
                },
                child: Text('Call Api Feature')),
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                    return UserPage();
                  }));
                },
                child: Text('Call Api Stream RxDart')),
          ],
        ),
      ),
    );
  }
}

enum TYPE { FEATURE, STREAM }
