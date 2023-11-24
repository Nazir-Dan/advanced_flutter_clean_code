import 'package:advanced_flutter_tut/app/di.dart';
import 'package:advanced_flutter_tut/presentation/forgot_password/view/forgot_password_view.dart';
import 'package:advanced_flutter_tut/presentation/login/view/login_view.dart';
import 'package:advanced_flutter_tut/presentation/main/main_view.dart';
import 'package:advanced_flutter_tut/presentation/onboarding/view/onboarding_view.dart';
import 'package:advanced_flutter_tut/presentation/register/view/register_view.dart';
import 'package:advanced_flutter_tut/presentation/resources/strings_manager.dart';
import 'package:advanced_flutter_tut/presentation/spalsh/splash_view.dart';
import 'package:advanced_flutter_tut/presentation/store_details/view/store_detailes_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splashRout = '/';
  static const String loginRout = '/login';
  static const String registerRout = '/register';
  static const String forgetPasswordRout = '/forgetPassword';
  static const String onBoardingRout = '/onBoarding';
  static const String mainRout = '/main';
  static const String storeDetailsRout = '/storeDetails';
}

class RoutesGenerator {
  static Route<dynamic> getRout(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRout:
        return MaterialPageRoute(builder: (_) => SplashView());
      case Routes.loginRout:
        initLoginModule();
        return MaterialPageRoute(builder: (_) => LogInView());
      case Routes.registerRout:
        initRegisterModule();
        return MaterialPageRoute(builder: (_) => RegisterView());
      case Routes.forgetPasswordRout:
        initForgotPasswordModule();
        return MaterialPageRoute(builder: (_) => ForgotPasswordView());
      case Routes.onBoardingRout:
        return MaterialPageRoute(builder: (_) => OnBoardingView());
      case Routes.mainRout:
        initHomeModule();
        return MaterialPageRoute(builder: (_) => MainView());
      case Routes.storeDetailsRout:
        initStoreDetailesModule();
        return MaterialPageRoute(builder: (_) => StoreDetailesView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.noRouteFound.tr()),
        ),
        body: Center(
          child: Text(AppStrings.noRouteFound.tr()),
        ),
      ),
    );
  }
}
