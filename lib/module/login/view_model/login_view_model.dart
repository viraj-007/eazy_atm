import '../../../model/state_model.dart';

class LoginViewModel {
  DataState dataState;
  ResponseModel? response;

  LoginViewModel({
    required this.dataState,
    this.response,
  });
}
