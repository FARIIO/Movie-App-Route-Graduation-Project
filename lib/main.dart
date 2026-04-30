import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_graduation_project_route/core/utils/app_routes.dart';
import 'package:movie_app_graduation_project_route/ui/screens/auth/forget_screen/screens/forget_screen.dart';
import 'package:movie_app_graduation_project_route/ui/screens/auth/login_screen/screens/login_screen.dart';
import 'package:movie_app_graduation_project_route/ui/screens/auth/register_screen/screens/register_screen.dart';
import 'package:movie_app_graduation_project_route/ui/screens/auth/update_screen/screen/update_screen.dart';
import 'package:movie_app_graduation_project_route/ui/screens/home_screen/home_screen.dart';
import 'package:movie_app_graduation_project_route/ui/screens/onboarding_screen/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
      EasyLocalization(
          supportedLocales: [
            Locale('en'),
            Locale('ar'),
          ],
          path: 'assets/translations',
          fallbackLocale: Locale('en'),
          startLocale: Locale('en'),
          child: MovieApp()
      )
  );
}

class MovieApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      initialRoute: AppRoutes.homeScreen,
      routes: {
        AppRoutes.onBoardingScreen : (context) => OnboardingScreen(),
        AppRoutes.loginScreen : (context) => LoginScreen(),
        AppRoutes.registerScreen : (context) => RegisterScreen(),
        AppRoutes.homeScreen : (context) => HomeScreen(),
        AppRoutes.forgetScreen : (context) => ForgetScreen(),
        AppRoutes.updateScreen : (context) => UpdateScreen(),
      },
    );
  }

}