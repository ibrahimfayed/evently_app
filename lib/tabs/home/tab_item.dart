import 'package:evently_app/app_theme.dart';
import 'package:evently_app/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TabItem extends StatelessWidget {
  String label;
  IconData icon;
  bool isSelected;

  TabItem({
    required this.isSelected,
    required this.label,
    required this.icon
    });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Color primaryColor = Theme.of(context).primaryColor;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: isSelected? AppTheme.primaryLight:AppTheme.white
        ),
      child: Row(
        children: [
          Icon(
            icon,
            color: isSelected? AppTheme.white : AppTheme.primaryLight,
          ),
          // SvgPicture.asset('assets/icons/sport.svg',
          // colorFilter:ColorFilter.mode(
          //   isSelected? AppTheme.white : primaryColor,
          //   BlendMode.srcIn) ,),
          SizedBox(height: 8,),
          Text(
            label,
          style: textTheme.titleMedium!.copyWith(
            color: isSelected ? AppTheme.white : AppTheme.black
          ),)
        ],
      ),
    );
  }
}