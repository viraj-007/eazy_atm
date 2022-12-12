class DataViewModel {
  DataState dataState;
  ResponseModel? response;

  DataViewModel({
    required this.dataState,
    this.response,
  });
}

class ResponseModel<T> {
  String statusCode;
  String statusMessage;
  T? data;
  ResponseModel({
    required this.statusCode,
    required this.statusMessage,
    this.data,
  });
}

enum DataState {
  initial,
  loading,
  noData,
  success,
  failed,
  noInternet,
}
