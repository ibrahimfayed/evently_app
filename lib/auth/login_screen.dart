import 'package:evently_app/auth/register_screen.dart';
import 'package:evently_app/firebase_service.dart';
import 'package:evently_app/home_screen.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/providers/user_provider.dart';
import 'package:evently_app/ui_utils.dart';
import 'package:evently_app/widgets/default_elevated_button.dart';
import 'package:evently_app/widgets/default_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/Login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    TextTheme textTheme = Theme.of(context).textTheme;
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: .start,
              children: [
                SizedBox(height: 24),
                Center(
                  child: Image.asset(
                    'assets/images/splash_logo.png',
                    height: 27,
                  ),
                ),
                SizedBox(height: 47),
                Text('Login to your account', style: textTheme.headlineSmall),
                SizedBox(height: 24),
                DefaultTextFormField(
                  hintText: 'Enter your email',
                  prefixIconImageName: 'email',
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.length < 5) {
                      return 'Invalid email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                DefaultTextFormField(
                  hintText: 'Enter your password',
                  prefixIconImageName: 'password',
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.length < 8) {
                      return 'Invalid password';
                    }
                    return null;
                  },
                  isPassword: true,
                ),
                SizedBox(height: screenHeight * 0.03),
                DefaultElevatedButton(
                  label: appLocalizations.login,
                  onPressed: login,
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: .center,
                  children: [
                    Text(appLocalizations.doNotHaveAnAccount, style: textTheme.titleSmall),
                    TextButton(
                      onPressed: () {
                        Navigator.of(
                          context,
                        ).pushReplacementNamed(RegisterScreen.routeName);
                      },
                      child: Text(appLocalizations.register),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login() {
    if (formKey.currentState!.validate()) {
      FirebaseService.login(
            email: emailController.text,
            password: passwordController.text,
          )
          .then((user) {
            Provider.of<UserProvider>(
              context,
              listen: false,
            ).updateCurrentUser(user);
            Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
          })
          .catchError((error) {
            String? errorMessage;
            if (error is FirebaseAuthException) {
              errorMessage = error.message;
            }
            UIUtils.showErrorMessage(errorMessage);
          });
    }
  }
}
