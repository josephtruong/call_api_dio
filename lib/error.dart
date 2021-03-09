import 'package:flutter/material.dart';

class ShowError extends StatelessWidget {
  final String message;

  const ShowError({Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withOpacity(0.1),
      child: Center(
        child: Container(
          color: Colors.transparent,
          child: Container(
              height: MediaQuery.of(context).size.height*0.25,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0)
              ),
              margin: EdgeInsets.symmetric(horizontal: 24),
              padding: EdgeInsets.fromLTRB(16, 24.0, 16, 20.0),
              child: Column(
                children: [
                  Text(
                    'Notification',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Text(
                    message,
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  Expanded(child: Container()),
                  MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'OK',
                      style: TextStyle(color: Colors.white),
                    ),
                    elevation: 0,
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(21)),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
