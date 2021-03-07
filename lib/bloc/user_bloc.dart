import 'package:call_api_dio/model/user_response.dart';
import 'package:call_api_dio/repository/user_repository.dart';
import 'package:rxdart/rxdart.dart';

final userBloc = UserBloc();

class UserBloc {
  final _users = BehaviorSubject<UserResponse>();

  Stream<UserResponse> get users => _users?.stream;
  UserRepository _userRepository;

  UserBloc() {
    _userRepository = UserRepository();
  }

  getUsers({int page}) async {
    final users = await _userRepository.getUsers(page: page);
    _users?.sink?.add(users);
  }

  Future<UserResponse> getUser() async {
    return await _userRepository.getUsers();
  }

  onDispose() {
    _users?.close();
  }
}
