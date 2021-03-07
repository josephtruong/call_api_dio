import 'package:call_api_dio/model/geo.dart';
import 'package:flutter/material.dart';

class ItemAddress extends StatelessWidget {
  final Geo location;

  const ItemAddress({Key key, this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            text: 'Address: ',
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
            children: <TextSpan>[
          TextSpan(
              text: location.street.number.toString() +
                  ' ' +
                  ' ' +
                  location.street.name +
                  ' ' +
                  location.city,
              style: TextStyle(
                  fontWeight: FontWeight.normal, color: Colors.black)),
        ]));
  }
}
