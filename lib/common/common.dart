import 'package:call_api_dio/error.dart';
import 'package:flutter/material.dart';
import 'package:call_api_dio/main.dart';

class Common {
  static showLoading(BuildContext context) {
    showDialog(
        context: context,
        builder: (ctx) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  static hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static showMessage({String message}) {
    showDialog(
        context: navigatorKey.currentState.overlay.context,
        builder: (ctx) {
          return ShowError(message: message);
        });
  }
}
