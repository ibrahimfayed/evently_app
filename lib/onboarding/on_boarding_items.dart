import 'package:evently_app/app_theme.dart';
import 'package:flutter/material.dart';

class OnBoardingItems extends StatelessWidget {
 
String mainText;
String image;
String secText;


OnBoardingItems({required this.image,required this.mainText,required this.secText});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: .start,
      children: [
        Image.asset(image, fit: .fill),
    SizedBox(height: 24,),
    Text(mainText,style: textTheme.titleLarge!.copyWith(fontWeight: .w600),),
    SizedBox(height: 8,),
    Text(secText,style: textTheme.titleMedium!.copyWith(
      fontWeight: .w400,
      color: AppTheme.darkGrey
    ),)


      ],
    );
    
  }
}