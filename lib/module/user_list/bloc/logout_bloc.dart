import '../../../bloc/bloc.dart';
import '../../../firebase/firebase_authentication.dart';
import '../../../firebase/firebase_helper/app_user_code.dart';
import '../../../model/state_model.dart';
import '../view_model/logout_view_model.dart';

class LogoutBloc extends Bloc<LogoutViewModel> {
  @override
  LogoutViewModel initDefaultValue() {
    return LogoutViewModel(
      dataState: DataState.initial,
    );
  }

  Future<void> logout() async {
    state.dataState = DataState.loading;
    emit(state);

    ResponseModel responseModel =
        await FirebaseAuthentication.authInstance.logout();
    if (responseModel.statusCode == AppErrorCode.success) {
      state.dataState = DataState.success;
    } else {
      state.dataState = DataState.failed;
    }
    emit(state);
  }
}
