import 'package:demo_eazy_atm/model/state_model.dart';
import 'package:demo_eazy_atm/model/user_model.dart';

class UserListViewModel {
  DataState dataState;
  List<UserModel> userList;

  UserListViewModel({
    required this.dataState,
    required this.userList,
  });
}
