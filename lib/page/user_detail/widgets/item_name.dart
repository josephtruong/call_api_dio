import 'package:flutter/material.dart';

class ItemName extends StatelessWidget {
  final String fullName;

  const ItemName({Key key, this.fullName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RichText(text: TextSpan(
        text: 'Full name: ', style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black),
        children: <TextSpan>[
          TextSpan(text: fullName, style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black)),
        ]
    ));
  }
}
