import 'package:call_api_dio/model/user_response.dart';
import 'package:call_api_dio/repository/user_repository.dart';
import 'package:rxdart/rxdart.dart';

final UserBloc userBloc = UserBloc();

class UserBloc {

  UserBloc() {
    _userRepository = UserRepository();
  }

  final BehaviorSubject<UserResponse> _users = BehaviorSubject<UserResponse>();

  Stream<UserResponse> get users => _users?.stream;
  UserRepository _userRepository;

  Future<UserResponse> getUsers({int page}) async {
    return await _userRepository.getUsers(page: page);
    // final users = await _userRepository.getUsers(page: page);
    // _users?.sink?.add(users);
  }

  Future<UserResponse> getUser() async {
    return await _userRepository.getUsers();
  }

  Future<void> onDispose() {
    _users?.close();
  }
}
