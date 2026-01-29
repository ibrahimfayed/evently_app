import 'package:evently_app/onboarding/on_boarding_items.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return OnBoardingItems(
      image: 'assets/images/second_on_boarding_img.png',
      mainText: 'Find Events That Inspire You',
      secText:
          "Dive into a world of events crafted to fit your unique interests. Whether you're into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.",
    );
  }
}
