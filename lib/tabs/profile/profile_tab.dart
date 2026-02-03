import 'package:evently_app/app_theme.dart';
import 'package:evently_app/auth/login_screen.dart';
import 'package:evently_app/firebase_service.dart';
import 'package:evently_app/models/language_model.dart';
import 'package:evently_app/models/user_model.dart';
import 'package:evently_app/providers/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel currentUser = Provider.of<UserProvider>(context).currentUser!;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/route_logo.png'),
            radius: 52,
          ),
          SizedBox(height: 16),
          Text(
            currentUser.name,
            style: textTheme.titleLarge!.copyWith(fontWeight: .w600),
          ),
          Text(currentUser.email, style: textTheme.titleSmall),
          SizedBox(height: 32),
          SwitchListTile(
            value: false,
            onChanged: (value) {},
            title: Text('Dark mode'),
            contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            activeTrackColor: Theme.of(context).primaryColor,
            inactiveTrackColor: AppTheme.lightGrey,
            thumbColor: WidgetStatePropertyAll(AppTheme.white),
            trackOutlineColor: WidgetStatePropertyAll(Colors.transparent),
          ), //like usual listTile but press on all it no switch tab just
          SizedBox(height: 16),
          ListTile(
            title: Text('Language'),
            trailing: DropdownButton(
              value: 'en',
              items: LanguageModel.languages
                  .map(
                    (language) => DropdownMenuItem(
                      value: language.code,
                      child: Text(language.name),
                    ),
                  )
                  .toList(),
              onChanged: (value) {},
              dropdownColor: AppTheme.white,
              borderRadius: BorderRadius.circular(16),
              underline: SizedBox(),
            ),
          ),
          SizedBox(height: 16),
          ListTile(
            title: Text('Logout'),
            trailing: SvgPicture.asset('assets/icons/logout.svg'),
            contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            onTap: () => FirebaseService.logout().then((_) {
              Navigator.of(
                context,
              ).pushReplacementNamed(LoginScreen.routeName).then((_) {
                Provider.of<UserProvider>(context).updateCurrentUser(null);
              });
            }),
          ),
        ],
      ),
    );
  }
}
