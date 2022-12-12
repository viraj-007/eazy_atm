import 'package:demo_eazy_atm/helper/app_color.dart';
import 'package:flutter/material.dart';
import '../../helper/app_localization.dart';

class RecentPayments extends StatelessWidget {
  const RecentPayments({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 160,
        width: 350,
        decoration: const BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              offset: Offset(
                2.0,
                2.0,
              ),
              blurRadius: 15.0,
              //spreadRadius: 1.0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(AppLocalization.recentPayments,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  const Spacer(),
                  SizedBox(
                    height: 25,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.redPrimary, elevation: 5),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text(AppLocalization.seeAll),
                          SizedBox(
                            width: 15,
                          ),
                          Icon(
                            // <-- Icon
                            Icons.arrow_forward_sharp,
                            size: 15.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  CircleAvatar(
                    backgroundColor: AppColor.yellow,
                  ),
                  Spacer(),
                  CircleAvatar(
                    backgroundColor: AppColor.purple,
                  ),
                  Spacer(),
                  CircleAvatar(
                    backgroundColor: AppColor.red,
                  ),
                  Spacer(),
                  CircleAvatar(backgroundColor: AppColor.lightBlue),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text(
                    AppLocalization.chaptain,
                  ),
                  Spacer(),
                  Text(AppLocalization.brian),
                  Spacer(),
                  Text(AppLocalization.fleece),
                  Spacer(),
                  Text(AppLocalization.fergus),
                ],
              ),
            ],
          ),
        ));
  }
}
