import 'package:evently_app/app_theme.dart';
import 'package:evently_app/auth/login_screen.dart';
import 'package:evently_app/auth/register_screen.dart';
import 'package:evently_app/create_event_screen.dart';
import 'package:evently_app/home_screen.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/onboarding/on_boarding_screen.dart';
import 'package:evently_app/providers/events_provider.dart';
import 'package:evently_app/providers/settings_provider.dart';
import 'package:evently_app/providers/user_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final onBoarding = prefs.getBool('onboarding') ?? false;
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => EventsProvider()..getEvents()),
        ChangeNotifierProvider(create: (_) => SettingsProvider()),
      ],
      child: EventlyApp(onBoarding: onBoarding),
    ),
  );
}

class EventlyApp extends StatelessWidget {
  final bool onBoarding;
  EventlyApp({this.onBoarding = false});

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        RegisterScreen.routeName: (_) => RegisterScreen(),
        LoginScreen.routeName: (_) => LoginScreen(),
        CreateEventScreen.routeName: (_) => CreateEventScreen(),
        OnBoardingScreen.routeName: (_) => OnBoardingScreen(),
      },
      initialRoute: onBoarding
          ? LoginScreen.routeName
          : OnBoardingScreen.routeName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: settingsProvider.themeMode,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(settingsProvider.languageCode),
    );
  }
}
