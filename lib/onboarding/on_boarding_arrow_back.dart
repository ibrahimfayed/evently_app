import 'package:evently_app/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnBoardingArrowBack extends StatelessWidget {
  const OnBoardingArrowBack({
    super.key,
    required PageController controller,
    required this.index,
  }) : _controller = controller;

  final PageController _controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        _controller.animateToPage(
          index - 1,
          duration: Duration(milliseconds: 250),
          curve: Curves.linear,
        );
      },
      icon: Container(
        margin: EdgeInsets.only(left: 0),
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: AppTheme.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: SvgPicture.asset(
          'assets/icons/arrow_left.svg',
          height: 24,
          width: 24,
          fit: .scaleDown,
        ),
      ),
    );
  }
}
