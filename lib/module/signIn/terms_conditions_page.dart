import 'package:demo_eazy_atm/helper/app_localization.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: Text(AppLocalization.termsAndConditions)),
    );
  }
}
