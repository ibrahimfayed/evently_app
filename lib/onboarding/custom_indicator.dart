import 'package:evently_app/app_theme.dart';
import 'package:flutter/material.dart';

class CustomIndicator extends StatelessWidget {
  final bool active;
  CustomIndicator({required this.active});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(
        milliseconds: 250),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: active ? AppTheme.primaryLight : Color(0xff707070)
      ),
       width: active ? 30 : 10, 
       height: 10,
        );
  }
}