import 'package:evently_app/app_theme.dart';
import 'package:evently_app/onboarding/on_boarding_items.dart';
import 'package:evently_app/onboarding/second_screen.dart';
import 'package:evently_app/widgets/default_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        OnBoardingItems(
          image: 'assets/images/first_on_boarding_img.png',
          mainText: 'Personalize Your Experience',
          secText:
              'Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.',
        ),
        SizedBox(height: 18.5),
        Row(
          children: [
            LeftText(text: 'Language'),
            Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: Text('English'),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(83, 32),
                elevation: 0,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                textStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(width: 8),
            ElevatedButton(
              onPressed: () {},
              child: Text('Arabic'),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(83, 32),
                elevation: 0,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                backgroundColor: AppTheme.white,
                foregroundColor: AppTheme.primaryLight,
                textStyle: textTheme.titleSmall,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        Row(
          children: [
            LeftText(text: 'Theme'),
            Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: SvgPicture.asset('assets/icons/sun.svg'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(width: 8),
            ElevatedButton(
              onPressed: () {},
              child: SvgPicture.asset('assets/icons/moon.svg'),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                backgroundColor: AppTheme.white,
                foregroundColor: AppTheme.primaryLight,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
        //SizedBox(height: 13),
        
      ],
    );
  }
}

class LeftText extends StatelessWidget {
  String text;
  LeftText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: .w500,
        fontSize: 18,
        color: AppTheme.primaryLight,
      ),
    );
  }
}
