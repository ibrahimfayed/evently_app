import 'package:evently_app/onboarding/on_boarding_items.dart';
import 'package:flutter/material.dart';

class ForthScreen extends StatelessWidget {
  static const String routeName = '/forthOnBoarding';

  @override
  Widget build(BuildContext context) {
    return OnBoardingItems(
      image: 'assets/images/forth_on_boarding_img.png',
      mainText: 'Connect with Friends & Share Moments',
      secText:
          'Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.',
    );
  }
}
