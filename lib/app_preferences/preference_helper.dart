import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  static final PreferencesHelper prefs = PreferencesHelper._internal();
  PreferencesHelper._internal();
  factory PreferencesHelper() => prefs;

  late SharedPreferences _sharedPreferences;

  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  String? getString(String key) {
    return _sharedPreferences.getString(key);
  }

  bool? getBool(String key) {
    return _sharedPreferences.getBool(key);
  }

  setString({required String key, required String value}) {
    _sharedPreferences.setString(key, value);
  }

  setBool({required String key, required bool value}) {
    _sharedPreferences.setBool(key, value);
  }
}
