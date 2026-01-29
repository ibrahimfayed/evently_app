import 'package:evently_app/app_theme.dart';
import 'package:evently_app/home_screen.dart';
import 'package:evently_app/onboarding/custom_indicator.dart';
import 'package:evently_app/onboarding/first_screen.dart';
import 'package:evently_app/onboarding/forth_screen.dart';
import 'package:evently_app/onboarding/on_boarding_arrow_back.dart';
import 'package:evently_app/onboarding/second_screen.dart';
import 'package:evently_app/onboarding/skip_button.dart';
import 'package:evently_app/onboarding/third_screen.dart';
import 'package:evently_app/widgets/default_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingScreen extends StatefulWidget {
  static const String routeName = '/onboarding';

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _controller = PageController();
  int index = 0;
  @override
  Widget build(BuildContext context) {
    // Size screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Visibility(
                    visible: index == 2 || index == 3,
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    child: OnBoardingArrowBack(
                      controller: _controller,
                      index: index,
                    ),
                  ),
                  Image.asset('assets/images/splash_logo.png', height: 27),
                  Visibility(
                    visible: index == 1 || index == 2,
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    child: SkipButton(),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Expanded(
                child: PageView(
                  onPageChanged: (value) {
                    setState(() {
                      index = value;
                    });
                  },
                  controller: _controller,
                  children: [
                    FirstScreen(),
                    SecondScreen(),
                    ThirdScreen(),
                    ForthScreen(),
                  ],
                ),
              ),
              DefaultElevatedButton(
                label: getButtonLabel(),
                onPressed: () async{
                  final prefs =await SharedPreferences.getInstance();
                  prefs.setBool('onboarding', true);
                  if (!mounted)return;
                  if (index == 3) {
                    Navigator.of(
                      context,
                    ).pushReplacementNamed(HomeScreen.routeName);
                  } else {
                    _controller.animateToPage(
                      index + 1,
                      duration: Duration(milliseconds: 250),
                      curve: Curves.linear,
                    );
                  }
                },
              ),
              Visibility(
                visible: index != 0,
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: Transform.translate(
                  offset: Offset(0, -310),
                  child: Row(
                    mainAxisAlignment: .center,
                    children: [
                      CustomIndicator(active: index == 1),
                      SizedBox(width: 5),
                      CustomIndicator(active: index == 2),
                      SizedBox(width: 5),
                      CustomIndicator(active: index == 3),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getButtonLabel() {
    if (index == 0) {
      return 'Let’s start';
    } else if (index == 3) {
      return 'Get started';
    }
    return 'Next';
  }
}
