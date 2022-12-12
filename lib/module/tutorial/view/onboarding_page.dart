import 'dart:async';
import 'package:demo_eazy_atm/helper/app_color.dart';
import 'package:flutter/material.dart';
import '../../../app_preferences/preferences.dart';
import '../../../helper/app_image.dart';
import '../../../helper/app_localization.dart';
import '../../../helper/app_routes.dart';
import '../view_model/onboarding_view_model.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);
  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  Timer? _timer;

  final List<OnboardingInfo> _onboardingPages = [
    OnboardingInfo(
      title: AppLocalization.onboardingInfoTitle,
      subtitle: AppLocalization.onboardingInfoSub1,
      description: AppLocalization.onboardingInfoDescription,
      imageAsset: AppImage.tutorialImage1,
    ),
    OnboardingInfo(
      title: AppLocalization.onboardingInfoTitle,
      subtitle: AppLocalization.onboardingInfoSub1,
      description: AppLocalization.onboardingInfoDescription,
      imageAsset: AppImage.tutorialImage1,
    ),
    OnboardingInfo(
      title: AppLocalization.onboardingInfoTitle,
      subtitle: AppLocalization.onboardingInfoSub3,
      description: AppLocalization.onboardingInfoDescription,
      imageAsset: AppImage.tutorialImage2,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: _buildPageView()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(
                flex: 3,
              ),
              SizedBox(
                height: 10,
                width: (_onboardingPages.length * 10) +
                    ((_onboardingPages.length - 1) * 5),
                child: _buildDotIndicator(),
              ),
              const Spacer(flex: 2),
              TextButton(
                onPressed: () {
                  Preference.setIsTutorialViewed(true);
                  Navigator.pushNamed(context, AppRoutes.welcomePage);
                },
                child: const Text(AppLocalization.skip),
              ),
            ],
          ),
        ],
      ),
    );
  }

  PageView _buildPageView() {
    return PageView.builder(
        controller: _pageController,
        itemCount: _onboardingPages.length,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return GestureDetector(
            onLongPressStart: (detail) {
              _stopTimer();
            },
            onLongPressEnd: (detail) {
              _startTimer();
            },
            child: _buildPageContent(index),
          );
        });
  }

  _buildPageContent(index) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 60,
          ),
          Text(_onboardingPages[index].title,
              style: const TextStyle(fontSize: 15, color: AppColor.red)),
          const SizedBox(
            height: 7,
          ),
          Text(
            _onboardingPages[index].subtitle,
            style: TextStyle(fontSize: 28, color: AppColor.indigoPrimary),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(_onboardingPages[index].description,
              style: const TextStyle(fontSize: 17)),
          const SizedBox(
            height: 80,
          ),
          Image.asset(_onboardingPages[index].imageAsset),
        ],
      ),
    );
  }

  Widget _buildDotIndicator() {
    return ListView.separated(
      itemCount: _onboardingPages.length,
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

  _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        if (_selectedIndex == _onboardingPages.length - 1) {
          _pageController.jumpToPage(0);
        } else {
          _pageController.nextPage(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut);
        }
      });
    });
  }

  _stopTimer() {
    _timer?.cancel();
  }

  @override
  void dispose() {
    _stopTimer();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }
}
