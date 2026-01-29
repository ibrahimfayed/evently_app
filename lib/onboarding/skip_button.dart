import 'package:evently_app/app_theme.dart';
import 'package:evently_app/home_screen.dart';
import 'package:flutter/material.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushReplacementNamed(
          context,
          HomeScreen.routeName,
        );
      },
      child: Text('Skip'),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 6,
        ),
        backgroundColor: AppTheme.white,
        foregroundColor: AppTheme.primaryLight,
        textStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}