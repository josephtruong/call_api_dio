import 'package:flutter/material.dart';

class ItemPhone extends StatelessWidget {
  final String phone;

  const ItemPhone({Key key, this.phone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            text: 'Mobile: ',
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
            children: <TextSpan>[
          TextSpan(
              text: phone, style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black)),
        ]));
  }
}
