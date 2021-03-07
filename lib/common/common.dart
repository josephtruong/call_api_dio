import 'package:flutter/material.dart';

class Common {
   static showLoading(BuildContext context) {
      showDialog(context: context, builder: (ctx) {
         return Center(
           child: CircularProgressIndicator(),
         );
      });
   }
   static hideLoading(BuildContext context) {
      Navigator.pop(context);
   }
}