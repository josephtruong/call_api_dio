import 'package:call_api_dio/error.dart';
import 'package:flutter/material.dart';
import 'package:call_api_dio/main.dart';

class Common {
  static Future<void> showLoading(BuildContext context) async {
    showDialog<void>(
        context: context,
        builder: (BuildContext cxt) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  static Future<void> hideLoading(BuildContext context) async {
    Navigator.pop(context);
  }

  static Future<void> showMessage({String message}) async {
    showDialog<void>(
        context: navigatorKey.currentState.overlay.context,
        builder: (BuildContext context) {
          return ShowError(message: message);
        });
  }
}
