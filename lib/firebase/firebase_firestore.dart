import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/state_model.dart';
import '../model/user_model.dart';
import 'firebase_helper/app_collections.dart';
import 'firebase_helper/app_user_code.dart';

class FirebaseStore {
  static final FirebaseStore storeInstance = FirebaseStore._internal();
  FirebaseStore._internal();
  factory FirebaseStore() => storeInstance;
  final FirebaseFirestore _store = FirebaseFirestore.instance;

  Future<ResponseModel> insertUserData(UserModel user) async {
    try {
      await _store
          .collection(AppCollections.user)
          .doc(user.userId)
          .set(user.toMap());
      return ResponseModel(
        statusCode: AppErrorCode.success,
        statusMessage: AppErrorMessage.success,
        data: user,
      );
    } on FirebaseException catch (e) {
      return ResponseModel(
        statusCode: e.code,
        statusMessage: e.message ?? AppErrorMessage.error,
      );
    } catch (e) {
      return ResponseModel(
        statusCode: AppErrorCode.failed,
        statusMessage: e.toString(),
      );
    }
  }

  Future<ResponseModel> fetchUserList() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _store.collection(AppCollections.user).get();
      List<UserModel> allData = querySnapshot.docs
          .map((doc) => UserModel.fromMap(doc.data()))
          .toList();

      return ResponseModel(
        statusCode: AppErrorCode.success,
        statusMessage: AppErrorMessage.success,
        data: allData,
      );
    } on FirebaseException catch (e) {
      return ResponseModel(
        statusCode: e.code,
        statusMessage: e.message ?? AppErrorMessage.error,
      );
    } catch (e) {
      return ResponseModel(
        statusCode: AppErrorCode.failed,
        statusMessage: e.toString(),
      );
    }
  }

  Future<ResponseModel> fetchUserDetail(String userId) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
          await _store.collection(AppCollections.user).doc(userId).get();
      Map<String, dynamic>? data = documentSnapshot.data();
      if (data == null) {
        return ResponseModel(
          statusCode: AppErrorCode.failed,
          statusMessage: AppErrorMessage.noData,
        );
      }
      return ResponseModel(
        statusCode: AppErrorCode.success,
        statusMessage: AppErrorMessage.success,
        data: UserModel.fromMap(data),
      );
    } on FirebaseException catch (e) {
      return ResponseModel(
        statusCode: e.code,
        statusMessage: e.message ?? AppErrorMessage.error,
      );
    } catch (e) {
      return ResponseModel(
        statusCode: AppErrorCode.failed,
        statusMessage: e.toString(),
      );
    }
  }
}
