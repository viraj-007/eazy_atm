import 'package:demo_eazy_atm/bloc/bloc.dart';
import '../../../firebase/firebase_authentication.dart';
import '../../../firebase/firebase_helper/app_user_code.dart';
import '../../../model/state_model.dart';
import '../view_model/login_view_model.dart';

class LoginBloc extends Bloc<LoginViewModel> {
  @override
  LoginViewModel initDefaultValue() {
    return LoginViewModel(
      dataState: DataState.initial,
    );
  }

  Future<void> login(LoginType loginType) async {
    state.dataState = DataState.loading;
    emit(state);

    if (loginType == LoginType.google) {
      ResponseModel responseModel =
          await FirebaseAuthentication.authInstance.googleSignIn();
      if (responseModel.statusCode == AppErrorCode.success) {
        state.dataState = DataState.success;
      } else {
        state.dataState = DataState.failed;
      }
    }
    emit(state);
  }
}

enum LoginType {
  google,
}
