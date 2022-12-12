import 'package:demo_eazy_atm/app.dart';
import 'package:demo_eazy_atm/app_preferences/preference_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await PreferencesHelper.prefs.init();
  runApp(const MyApp());
}
