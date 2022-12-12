import 'package:demo_eazy_atm/helper/app_color.dart';
import 'package:flutter/material.dart';
import '../../../../model/user_model.dart';

class UserListTile extends StatelessWidget {
  const UserListTile({
    Key? key,
    required this.user,
    required this.onTap,
  }) : super(key: key);

  final UserModel user;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColor.blueGrey,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              _buildImageView(),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  user.name,
                  style: const TextStyle(
                    color: AppColor.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageView() {
    String image = user.profileImage ?? '';
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: image.isEmpty
          ? const Icon(
              Icons.person,
              size: 50,
            )
          : Image.network(
              image,
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
    );
  }
}
