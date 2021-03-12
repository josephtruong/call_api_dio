import 'package:call_api_dio/bloc/user_bloc.dart';
import 'package:call_api_dio/common/common.dart';
import 'package:call_api_dio/error_page.dart';
import 'package:call_api_dio/model/user.dart';
import 'package:call_api_dio/model/user_response.dart';
import 'package:call_api_dio/page/user_detail/user_detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  BuildContext context;
  final int _page = 1;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    userBloc.getUsers(page: _page);
    super.initState();
    //Use  Future.delayed when show loading out side function build()
    // Future.delayed(Duration.zero).then((value) => getUser());
    _scrollController.addListener(() {
      print('--------->');
    });
  }

 Future<void> getUser(BuildContext context) async {
    Common.showLoading(context);
    final UserResponse userResponse = await userBloc.getUser();
    if (userResponse != null) {
      if (userResponse.results.isNotEmpty) {
        print('Size User ---> ${userResponse.results.length}');
      } else {
        print('Error server -------------> ${userResponse.error}');
      }
      Common.hideLoading(context);
    } else {
      print('Error  -------------> }');
    }
  }

  @override
  Widget build(BuildContext context) {
    print('====================>');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
        actions: [
          IconButton(icon: const Icon(Icons.search_outlined), onPressed: () {})
        ],
      ),
      body: Container(),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
        actions: [
          IconButton(icon: const Icon(Icons.search_outlined), onPressed: () {})
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async{
          getUser(context);
        },
        child: StreamBuilder<UserResponse>(
            stream: userBloc.users,
            builder: (BuildContext context, AsyncSnapshot<UserResponse> snapshot) {
              if (snapshot.hasData) {
                print(snapshot.data.error);
                if (snapshot.data.error != null &&
                    snapshot.data.results.isEmpty) {
                  return ErrorPage(onTap: () {
                      userBloc.getUsers(page: 1);
                  }, msgError: snapshot.data.error,);
                } else {
                  final List<User> users = snapshot.data.results;
                  return ListView.separated(
                      controller: _scrollController,
                      itemCount: users.length + 1,
                      separatorBuilder: (BuildContext ctx, int index) => const Divider(),
                      itemBuilder: (BuildContext ctx, int index) {
                        if (index == 0) {
                          return Container(
                            child: const TextField(
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 12),
                                  hintText: 'Search'),
                            ),
                          );
                        }
                        final User user = users[index - 1];
                        return ListTile(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (BuildContext ctx) {
                              return UserDetailPage(
                                user: user,
                              );
                            }));
                          },
                          title: Text(user.name.title +
                              ': ' +
                              user.name.first +
                              user.name.last),
                          subtitle: Text(user.email),
                          leading: Image.network(user.picture.thumbnail),
                        );
                      });
                }
              }
              return const Center(child:  CircularProgressIndicator());
            }),
      ),
    );
  }
}
