import 'package:evently_app/onboarding/on_boarding_items.dart';
import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  static const String routeName = '/thirdOnBoarding';

  @override
  Widget build(BuildContext context) {
    return OnBoardingItems(
      image: 'assets/images/third_on_boarding_img.png',
      mainText: 'Effortless Event Planning',
      secText:
          'Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.',
    );
  }
}
