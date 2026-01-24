import 'package:evently_app/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ArrowBack extends StatelessWidget {
  const ArrowBack({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){
        Navigator.of(context).pop();
      },
      icon: Container(
        margin: EdgeInsets.only(left: 16),
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: AppTheme.white,
          borderRadius: BorderRadius.circular(8)
        ),
        child: SvgPicture.asset('assets/icons/arrow_left.svg',height: 24,width: 24,fit: .scaleDown,),
      ),
    );
  }
}