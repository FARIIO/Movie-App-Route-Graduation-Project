import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_graduation_project_route/core/utils/app_routes.dart';
import 'package:movie_app_graduation_project_route/ui/screens/auth/forget_screen/screens/forget_screen.dart';
import 'package:movie_app_graduation_project_route/ui/screens/auth/login_screen/screens/login_screen.dart';
import 'package:movie_app_graduation_project_route/ui/screens/auth/register_screen/screens/register_screen.dart';
import 'package:movie_app_graduation_project_route/ui/screens/auth/update_screen/screen/update_screen.dart';
import 'package:movie_app_graduation_project_route/ui/screens/home_screen/home.dart';
import 'package:movie_app_graduation_project_route/ui/screens/initial_screen/initial_screen.dart';
import 'package:movie_app_graduation_project_route/ui/screens/onboarding_screen/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/utils/app_theme.dart';
import 'ui/screens/auth/cubit/auth_cubit.dart';
import 'ui/screens/auth/forget_screen/screens/forget_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  final prefs = await SharedPreferences.getInstance();
  bool isFirstTime = prefs.getBool("isFirstTime") ?? true;

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      startLocale: Locale('en'),
      child: BlocProvider<AuthCubit>(
        create: (context) => AuthCubit(),
        child: MovieApp(isFirstTime: isFirstTime),
      ),
    ),
  );
}

class MovieApp extends StatelessWidget {
  final bool isFirstTime;
  const MovieApp({required this.isFirstTime});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      initialRoute: isFirstTime
          ? AppRoutes.initialScreen
          : AppRoutes.loginScreen,
      theme: AppTheme.lightTheme,
      routes: {
        AppRoutes.initialScreen: (context) => InitialScreen(),
        AppRoutes.onBoardingScreen: (context) => OnBoardingScreen(),
        AppRoutes.loginScreen: (context) => LoginScreen(),
        AppRoutes.registerScreen: (context) => RegisterScreen(),
        AppRoutes.forgetScreen: (context) => ForgetPassword(),
        AppRoutes.updateScreen: (context) => UpdateScreen(),
        AppRoutes.home: (context) => Home(),
      },
    );
  }
}
