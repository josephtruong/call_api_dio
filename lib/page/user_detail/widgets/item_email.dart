import 'package:flutter/material.dart';

class ItemEmail extends StatelessWidget {
  final String email;

  const ItemEmail({Key key, this.email}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RichText(text: TextSpan(
        text: 'Email: ', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
        children: <TextSpan>[
          TextSpan(text: email, style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black)),
        ]
    ));
  }
}
