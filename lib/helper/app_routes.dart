import 'package:flutter/material.dart';
import '../module/signIn/signup_page.dart';
import '../module/signIn/terms_conditions_page.dart';
import '../module/splash/splash_screen.dart';
import '../module/tutorial/view/onboarding_page.dart';
import '../module/user_detail/view/user_detail.dart';
import '../module/user_list/view/user_list.dart';
import '../module/welcome/welcome_page.dart';
import '../user_profile/user_profile.dart';

class AppRoutes {
  static const String splashScreen = '/splashScreen';
  static const String welcomePage = '/welcome';
  static const String signupPage = '/signup';
  static const String userProfile = '/userProfile';
  static const String userDetail = '/userDetail';
  static const String userList = '/userList';
  static const String termsConditions = '/termsConditions';
  static const String onboardingPage = '/onboardingPage';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      splashScreen: (context) => const Splashscreen(),
      welcomePage: (context) => const WelcomePage(),
      signupPage: (context) => const SignupPage(),
      userProfile: (context) => const UserProfile(),
      userDetail: (context) => const UserDetail(),
      userList: (context) => const UserListScreen(),
      termsConditions: (context) => const Loading(),
      onboardingPage: (context) => const OnboardingPage(),
    };
  }
}
