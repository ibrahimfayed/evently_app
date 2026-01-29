import 'package:evently_app/app_theme.dart';
import 'package:evently_app/auth/login_screen.dart';
import 'package:evently_app/auth/register_screen.dart';
import 'package:evently_app/create_event_screen.dart';
import 'package:evently_app/home_screen.dart';
import 'package:evently_app/onboarding/first_screen.dart';
import 'package:evently_app/onboarding/forth_screen.dart';
import 'package:evently_app/onboarding/on_boarding_screen.dart';
import 'package:evently_app/onboarding/second_screen.dart';
import 'package:evently_app/onboarding/third_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const EventlyApp());
}

class EventlyApp extends StatelessWidget {
  const EventlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName:(_)=>HomeScreen(),
        RegisterScreen.routeName:(_)=>RegisterScreen(),
        LoginScreen.routeName:(_)=>LoginScreen(),
        CreateEventScreen.routeName:(_)=>CreateEventScreen(),
        OnBoardingScreen.routeName:(_)=>OnBoardingScreen(),
      },
      initialRoute: OnBoardingScreen.routeName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
    );
  }
}