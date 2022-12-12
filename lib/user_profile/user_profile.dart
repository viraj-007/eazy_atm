import 'package:flutter/material.dart';
import '../app_preferences/preferences.dart';
import '../model/user_model.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    UserModel? userModel = Preference.getUserData();
    return Scaffold(
      appBar: AppBar(title: const Text('User Profile')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: 20.0,
              height: 20.0,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(userModel?.profileImage ?? ''),
                  ))),
          Text('Name:${userModel?.email ?? ''}'),
          // Text('Name: ${userModel?.name ?? ''}'),
          // Text('Email: ${userModel?.email ?? ''}'),
          //
        ],
      ),
    );
  }
}
