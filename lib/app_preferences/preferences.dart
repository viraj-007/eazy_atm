import 'package:demo_eazy_atm/app_preferences/preference_helper.dart';
import '../model/user_model.dart';

class Preference {
  static setIsTutorialViewed(bool value) {
    PreferencesHelper.prefs
        .setBool(key: PreferenceConst.kIsTutorialViewed, value: value);
  }

  static bool? get isTutorialViewed =>
      PreferencesHelper.prefs.getBool(PreferenceConst.kIsTutorialViewed);

  static setUserData(UserModel userModel) {
    PreferencesHelper.prefs
        .setString(key: PreferenceConst.kUserId, value: userModel.userId);
    PreferencesHelper.prefs
        .setString(key: PreferenceConst.nameKey, value: userModel.name);
    PreferencesHelper.prefs
        .setString(key: PreferenceConst.emailKey, value: userModel.email);
    String profileImage = userModel.profileImage ?? "";
    if (profileImage.isNotEmpty) {
      PreferencesHelper.prefs
          .setString(key: PreferenceConst.imgKey, value: profileImage);
    }

    String phoneNumber = userModel.phoneNumber ?? "";
    if (phoneNumber.isNotEmpty) {
      PreferencesHelper.prefs
          .setString(key: PreferenceConst.kPhoneNumber, value: phoneNumber);
    }
  }

  static String? get userId =>
      PreferencesHelper.prefs.getString(PreferenceConst.kUserId);
  static UserModel? getUserData() {
    String userId =
        PreferencesHelper.prefs.getString(PreferenceConst.kUserId) ?? '';
    if (userId.isEmpty) return null;
    String name =
        PreferencesHelper.prefs.getString(PreferenceConst.nameKey) ?? '';
    String email =
        PreferencesHelper.prefs.getString(PreferenceConst.emailKey) ?? '';
    String phoneNumber =
        PreferencesHelper.prefs.getString(PreferenceConst.kPhoneNumber) ?? '';
    String profileImage =
        PreferencesHelper.prefs.getString(PreferenceConst.kProfileImage) ?? '';
    return UserModel(
      userId: userId,
      email: email,
      name: name,
      phoneNumber: phoneNumber,
      profileImage: profileImage,
    );
  }
}

class PreferenceConst {
  static const String kUserId = 'user_id';
  static const String nameKey = 'name';
  static const String emailKey = 'email';
  static const String imgKey = 'image';
  static const String kPhoneNumber = 'phone_number';
  static const String kProfileImage = 'profile_image';
  static const String kIsTutorialViewed = 'is_tutorial_viewed';
}
