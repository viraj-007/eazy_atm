import 'package:demo_eazy_atm/helper/app_color.dart';
import 'package:demo_eazy_atm/module/recharge_payments/recent_payments.dart';
import 'package:demo_eazy_atm/module/recharge_payments/recharge_paybills.dart';
import 'package:flutter/material.dart';
import '../../helper/app_image.dart';
import '../../helper/app_localization.dart';

class RechargePaymentsScreen extends StatefulWidget {
  const RechargePaymentsScreen({Key? key}) : super(key: key);

  @override
  State<RechargePaymentsScreen> createState() => _RechargePaymentsScreenState();
}

class _RechargePaymentsScreenState extends State<RechargePaymentsScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.qr_code_scanner_outlined,
              size: 35.0,
            ),
          ),
          Flexible(
            child: Row(
              children: [
                const CircleAvatar(
                    backgroundImage: AssetImage(AppImage.flagImage)),
                // const SizedBox(
                //   width: 10,
                // ),
                const Spacer(),
                const Text(
                  AppLocalization.guwahati,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.arrow_drop_down)),
                const Spacer(
                  flex: 3,
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_on_outlined)),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.account_circle_outlined,
                      size: 30,
                    )),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 160, width: 350, child: _buildPageView()),
              SizedBox(
                height: 10,
                width: (3 * 10) + ((2) * 5),
                child: _buildDotIndicator(),
              ),
              const SizedBox(
                height: 10,
              ),
              const RechargeAndBills(),
              const SizedBox(
                height: 20,
              ),
              const RecentPayments(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 10,
        color: Colors.white,
        shape: const AutomaticNotchedShape(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0), topRight: Radius.circular(0))),
            RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(40)))),
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              InkWell(
                child: Column(
                  children: const [
                    Icon(Icons.home),
                    Text(AppLocalization.home)
                  ],
                ),
              ),
              const SizedBox(),
              InkWell(
                child: Column(
                  children: const [
                    Icon(Icons.history_sharp),
                    Text(AppLocalization.history)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {},
        child: const Icon(Icons.camera),
      ),
    );
  }

  PageView _buildPageView() {
    return PageView.builder(
        scrollDirection: Axis.horizontal,
        controller: _pageController,
        itemCount: 3,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return Container(
            height: 160,
            width: 350,
            decoration: const BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const Icon(
                          Icons.navigation_outlined,
                          size: 30,
                          color: Colors.white,
                        ),
                        RichText(
                          text: TextSpan(children: <TextSpan>[
                            TextSpan(
                                text: AppLocalization.newProfits,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepOrange.shade900,
                                    fontSize: 15)),
                            const TextSpan(
                              text: AppLocalization.oldBanners,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ]),
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Expanded(
                        child: Image.asset(AppImage.horizontalDrawer,
                            fit: BoxFit.fitWidth),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  _buildDotIndicator() {
    return ListView.separated(
      itemCount: 3,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _selectedIndex == index ? Colors.red : Colors.grey,
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Container(
          width: 5,
        );
      },
    );
  }
}
