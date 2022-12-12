import 'package:demo_eazy_atm/helper/app_color.dart';
import 'package:demo_eazy_atm/helper/app_localization.dart';
import 'package:demo_eazy_atm/module/login/bloc/login_bloc.dart';
import 'package:demo_eazy_atm/module/user_list/view/user_list.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../bloc/bloc_builder.dart';
import '../../helper/app_routes.dart';
import '../../model/state_model.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final LoginBloc _loginBloc = LoginBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
          child: _buildColumn(context),
        ),
      ),
    );
  }

  Widget _buildColumn(BuildContext context) {
    return Column(
      children: <Widget>[
        const Spacer(),
        const Text(
          AppLocalization.onboardingInfoTitle,
          style: TextStyle(
            fontSize: 30,
            color: AppColor.redPrimary,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(AppLocalization.signupDescrp, textAlign: TextAlign.center),
        const SizedBox(
          height: 15,
        ),
        const Spacer(
          flex: 1,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: AppColor.red,
              ),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              GestureDetector(
                child: Row(
                  children: const [
                    Icon(
                      Icons.arrow_drop_down,
                      color: AppColor.red,
                    ),
                    Text(
                      AppLocalization.isd,
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
                child: VerticalDivider(
                  color: AppColor.black,
                  thickness: 1,
                  endIndent: 2,
                ),
              ),
              const Expanded(
                  child: TextField(
                decoration: InputDecoration(
                  hintText: AppLocalization.phoneNumber,
                  hintStyle: TextStyle(color: AppColor.grey),
                  focusedBorder: InputBorder.none,
                ),
              )),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        BlocBuilder(
            bloc: _loginBloc,
            builder: () {
              return SizedBox(
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 55,
                  color: AppColor.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onPressed: () async {
                    await _loginBloc.login(LoginType.google);
                    if (_loginBloc.state.dataState == DataState.success) {
                      // ignore: use_build_context_synchronously
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UserListScreen()));
                    }
                  },
                  child: _loginBloc.state.dataState == DataState.loading
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            //Text('Loading...', style: TextStyle(fontSize: 15,color: Colors.white,)),
                            // SizedBox(width: 10,),
                            CircularProgressIndicator(
                              color: AppColor.white,
                            ),
                          ],
                        )
                      : const Text(AppLocalization.signUp,
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColor.white,
                          )),
                ),
              );
            }),
        const SizedBox(
          height: 17,
        ),
        RichText(
          text: TextSpan(
            children: <TextSpan>[
              const TextSpan(
                  text: AppLocalization.accept,
                  style: TextStyle(color: AppColor.black)),
              TextSpan(
                  text: AppLocalization.terms,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushNamed(context, AppRoutes.termsConditions);
                    },
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: AppColor.black)),
              const TextSpan(
                  text: AppLocalization.and,
                  style: TextStyle(color: AppColor.black)),
              TextSpan(
                  text: AppLocalization.conditions,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushNamed(context, AppRoutes.termsConditions);
                    },
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: AppColor.black)),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 30,
        ),
        Row(children: const <Widget>[
          Expanded(
              child: Divider(
            color: AppColor.grey,
            thickness: 1,
            indent: 5.0,
            endIndent: 10.0,
          )),
          Text(
            AppLocalization.alreadyAccount,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          Expanded(
              child: Divider(
            color: AppColor.grey,
            thickness: 1,
            indent: 10,
            endIndent: 5,
          )),
        ]),
        const SizedBox(
          height: 10,
        ),
        OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(double.infinity, 55),
              side: BorderSide(color: AppColor.redSecondary),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(AppLocalization.signIn,
                style: TextStyle(color: AppColor.redSecondary))),
        const Spacer(
          flex: 2,
        ),
      ],
    );
  }
}
