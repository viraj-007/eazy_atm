import 'package:demo_eazy_atm/helper/app_color.dart';
import 'package:demo_eazy_atm/helper/app_localization.dart';
import 'package:demo_eazy_atm/helper/app_routes.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.redPrimary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
          child: _buildColumn(context),
        ),
      ),
    );
  }

  _buildColumn(BuildContext context) {
    return Column(
      children: <Widget>[
        const Spacer(
          flex: 2,
        ),
        const Text(
          AppLocalization.welcome,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: AppColor.white,
          ),
        ),
        const SizedBox(height: 11),
        const Text(AppLocalization.manage,
            style: TextStyle(
              color: AppColor.whiteSecondary,
              fontSize: 12,
            )),
        const SizedBox(height: 4.0),
        const Text(
          AppLocalization.seamlessly,
          style: TextStyle(
            color: AppColor.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        const Spacer(
          flex: 2,
        ),
        const SizedBox(
          width: double.infinity,
          child: Text(AppLocalization.forgotPassword,
              style: TextStyle(
                color: AppColor.whiteSecondary,
              )),
        ),
        const Spacer(
          flex: 2,
        ),
        MaterialButton(
          minWidth: double.infinity,
          height: 45,
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.signupPage);
          },
          color: AppColor.white,
          textColor: Colors.red[900],
          child: const Text(AppLocalization.signInNumber),
        ),
        const SizedBox(height: 15),
        MaterialButton(
            minWidth: double.infinity,
            height: 45,
            color: AppColor.black,
            textColor: AppColor.white,
            onPressed: () {},
            child: const Text(AppLocalization.createAccount))
      ],
    );
  }
}
