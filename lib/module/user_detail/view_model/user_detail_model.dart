import '../../../model/state_model.dart';
import '../../../model/user_model.dart';

class UserDetailViewModel {
  DataState dataState;
  UserModel? user;

  UserDetailViewModel({
    required this.dataState,
    this.user,
  });
}
