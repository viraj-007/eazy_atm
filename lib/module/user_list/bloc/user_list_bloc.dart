import '../../../bloc/bloc.dart';
import '../../../firebase/firebase_firestore.dart';
import '../../../firebase/firebase_helper/app_user_code.dart';
import '../../../model/state_model.dart';
import '../../../model/user_model.dart';
import '../view_model/user_list_view_model.dart';

class UserListBloc extends Bloc<UserListViewModel> {
  @override
  UserListViewModel initDefaultValue() {
    return UserListViewModel(
      dataState: DataState.initial,
      userList: [],
    );
  }

  Future<void> fetchUserList() async {
    state.dataState = DataState.loading;
    emit(state);

    ResponseModel responseModel =
        await FirebaseStore.storeInstance.fetchUserList();
    if (responseModel.statusCode == AppErrorCode.success) {
      state.userList = responseModel.data as List<UserModel>;
      state.dataState =
          state.userList.isEmpty ? DataState.noData : DataState.success;
    } else {
      state.dataState = DataState.failed;
    }
    emit(state);
  }
}
