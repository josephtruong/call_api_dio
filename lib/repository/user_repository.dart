import 'package:call_api_dio/model/user_response.dart';
import 'package:call_api_dio/provider/user_provider.dart';

class UserRepository {
  UserApiProvider _apiProvider = UserApiProvider();

  Future<UserResponse> getUsers({int page})  {
     return  _apiProvider.getUsers(page: page);
  }
}