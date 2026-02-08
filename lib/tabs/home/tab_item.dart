import 'package:evently_app/app_theme.dart';
import 'package:evently_app/models/category_model.dart';
import 'package:evently_app/providers/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class TabItem extends StatelessWidget {
  String label;
  IconData icon;
  bool isSelected;

  TabItem({required this.isSelected, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Color primaryColor = Theme.of(context).primaryColor;
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: isSelected
            ? null
            : Border.all(
                color: settingsProvider.isDark
                    ? AppTheme.borderDark
                    : AppTheme.offWhite,
              ),
        color: isSelected
            ? primaryColor
            : settingsProvider.isDark
            ? AppTheme.navy
            : AppTheme.white,
      ),

      child: Row(
        children: [
          Icon(
            icon,
            color: isSelected ? AppTheme.white : AppTheme.primaryLight,
          ),
          // SvgPicture.asset('assets/icons/sport.svg',
          // colorFilter:ColorFilter.mode(
          //   isSelected? AppTheme.white : primaryColor,
          //   BlendMode.srcIn) ,),
          SizedBox(height: 8),
          Text(
            label,
            style: textTheme.titleMedium!.copyWith(
              color: isSelected
                  ? AppTheme.white
                  : settingsProvider.isDark
                  ? AppTheme.white
                  : AppTheme.black,
            ),
          ),
        ],
      ),
    );
  }
}
