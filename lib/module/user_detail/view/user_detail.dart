import 'package:demo_eazy_atm/helper/utils.dart';
import 'package:demo_eazy_atm/module/user_detail/bloc/user_detail_bloc.dart';
import 'package:flutter/material.dart';
import '../../../bloc/bloc_builder.dart';
import '../../../model/user_model.dart';

class UserDetail extends StatefulWidget {
  const UserDetail({Key? key}) : super(key: key);
  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  final UserDetailBloc _userDetailBloc = UserDetailBloc();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      String userId = ModalRoute.of(context)?.settings.arguments as String;
      _userDetailBloc.fetchUserDetail(userId);
    });
  }

  @override
  Widget build(BuildContext context) {
    // UserModel? userModel = Preference.getUserData();
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile '),
      ),
      body: BlocBuilder(
          bloc: _userDetailBloc,
          builder: () {
            // userModel: _userDetailBloc.state.user?.userId;
            UserModel? userModel = _userDetailBloc.state.user;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(padding: EdgeInsets.symmetric(vertical: 10,horizontal:20 )),
                Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(userModel?.profileImage ?? ''),
                        ))),
                const SizedBox(height: 10,),
                Text('Name: ${userModel?.name ?? ''}'),
                Row(
                  children: [
                    const Icon(Icons.mail_outline_rounded),
                    TextButton(
                      onPressed: () {
                        Utils.openEmail(
                            toEmail: userModel?.email ?? '',
                            subject: 'Official',
                            body: 'Hi');
                      },
                      child: Text(userModel?.email ?? ''),
                    ),
                  ],
                ),
              ],
            );
          }),
    );
  }
}
