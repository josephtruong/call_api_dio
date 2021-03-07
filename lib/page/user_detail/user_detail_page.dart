import 'package:call_api_dio/model/user.dart';
import 'package:call_api_dio/page/user_detail/widgets/item_address.dart';
import 'package:call_api_dio/page/user_detail/widgets/item_email.dart';
import 'package:call_api_dio/page/user_detail/widgets/item_map.dart';
import 'package:call_api_dio/page/user_detail/widgets/item_name.dart';
import 'package:call_api_dio/page/user_detail/widgets/item_phone.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserDetailPage extends StatefulWidget {
  final User user;

  const UserDetailPage({Key key, this.user}) : super(key: key);

  @override
  _UserDetailPageState createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  @override
  Widget build(BuildContext context) {
    User user = widget.user;
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 120,
                width: 120,
                margin: EdgeInsets.only(top: 20, bottom: 36),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: NetworkImage(user.picture.large))),
              ),
            ),
            ItemName(fullName: user.name.first + user.name.last,),
            const SizedBox(height: 16,),
            ItemEmail(email: user.email,),
            const SizedBox(height: 16,),
            ItemPhone(phone: user.phone,),
            const SizedBox(height: 16,),
            ItemAddress(location: user.location,),
            const SizedBox(height: 16,),
            ItemMap(),
          ],
        ),
      ),
    );
  }
}
