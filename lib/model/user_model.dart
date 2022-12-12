import 'package:demo_eazy_atm/helper/extensions.dart';

class UserModel {
  final String userId;
  final String email;
  final String name;
  final String? profileImage;
  final String? phoneNumber;

  UserModel({
    required this.userId,
    required this.email,
    required this.name,
    this.profileImage,
    this.phoneNumber,
  });

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        userId: json['userId'],
        email: json['email'],
        name: json['name'],
        profileImage: json['profileImage'],
        phoneNumber: json['phoneMumber'],
      );

  Map<String, dynamic> toMap() {
    Map<String, dynamic> userMap = {
      'userId': userId,
      'email': email,
      'name': name,
    };
    if (!profileImage.isNullOrEmpty) {
      userMap['profileImage'] = profileImage;
    }
    if (!phoneNumber.isNullOrEmpty) {
      userMap['phoneMumber'] = phoneNumber;
    }
    return userMap;
  }
}
