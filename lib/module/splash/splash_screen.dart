import 'package:demo_eazy_atm/helper/app_color.dart';
import 'package:demo_eazy_atm/helper/app_image.dart';
import 'package:demo_eazy_atm/helper/app_routes.dart';
import 'package:flutter/material.dart';
import '../../app_preferences/preferences.dart';
import '../../helper/app_localization.dart';
import '../../model/user_model.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _navigateToTutorial(context);
    return Scaffold(
      backgroundColor: AppColor.red,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImage.splashImage,
            ),
            const SizedBox(
              height: 45,
            ),
            const Text(
              AppLocalization.splashTitle,
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: AppColor.white,
              ),
            )
          ],
        ),
      ),
    );
  }

  void _navigateToTutorial(BuildContext context) {
    UserModel? userModel = Preference.getUserData();
    Future.delayed(const Duration(milliseconds: 1000), () {
      if (userModel == null) {
        bool isTutorialViewed = Preference.isTutorialViewed ?? false;
        if (isTutorialViewed) {
          Navigator.pushNamed(context, AppRoutes.welcomePage);
        } else {
          Navigator.pushNamed(context, AppRoutes.onboardingPage);
        }
      } else {
        Navigator.pushNamed(context, AppRoutes.userList);
      }
    });
  }
}
