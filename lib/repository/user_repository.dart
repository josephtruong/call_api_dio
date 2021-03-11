import 'package:call_api_dio/model/info.dart';
import 'package:call_api_dio/model/response.dart';
import 'package:call_api_dio/model/user.dart';
import 'package:call_api_dio/model/user_response.dart';
import 'package:call_api_dio/provider/user_provider.dart';

class UserRepository {
  UserApiProvider _apiProvider = UserApiProvider();

  getUsers({int page}) async {
    BaseResponseBody responseBody = await _apiProvider.getUsers(page: page);
    User user = User();
    user = responseBody.results;
    print(user.phone);
  }
}
