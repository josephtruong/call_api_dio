import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ErrorPage extends StatelessWidget {
  final Function onTap;
  final String msgError;
  final _isLoading = ValueNotifier(false);

  ErrorPage({Key key, this.onTap, this.msgError}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ..._buildProgress(),
          Text(
           msgError,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          TextButton.icon(
            icon: Icon(
              Icons.warning_amber_outlined,
              color: Colors.red,
            ),
            onPressed: () {
              _isLoading.value = true;
              Debouncer(milliseconds: 1000).run(() {
                onTap();
              });
            },
            label: Text(
              'Try again',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  _buildProgress() {
    return [
      ValueListenableBuilder(valueListenable: _isLoading, builder: (ctx, value, child){
        if (value) {
          return CircularProgressIndicator();
        }
        return Container();
      }),
      SizedBox(
        height: 48,
      )
    ];
  }
}

class Debouncer {
  final int milliseconds;
  VoidCallback action;
  Timer _timer;

  Debouncer({this.milliseconds});

  run(VoidCallback action) {
    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
