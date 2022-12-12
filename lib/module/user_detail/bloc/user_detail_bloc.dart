import '../../../bloc/bloc.dart';
import '../../../firebase/firebase_firestore.dart';
import '../../../firebase/firebase_helper/app_user_code.dart';
import '../../../model/state_model.dart';
import '../../../model/user_model.dart';
import '../view_model/user_detail_model.dart';

class UserDetailBloc extends Bloc<UserDetailViewModel> {
  @override
  UserDetailViewModel initDefaultValue() {
    return UserDetailViewModel(
      dataState: DataState.initial,
    );
  }

  Future<void> fetchUserDetail(String userId) async {
    state.dataState = DataState.loading;
    emit(state);

    ResponseModel responseModel =
        await FirebaseStore.storeInstance.fetchUserDetail(userId);
    if (responseModel.statusCode == AppErrorCode.success) {
      state.user = responseModel.data as UserModel;
      state.dataState = DataState.success;
      emit(state);
      return;
    }

    state.dataState = DataState.failed;
    emit(state);
  }
}
