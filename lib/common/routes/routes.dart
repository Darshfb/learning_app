import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learning_app/common/routes/names.dart';
import 'package:learning_app/common/values/constants.dart';
import 'package:learning_app/features/app/app_screen.dart';
import 'package:learning_app/features/login/login_screen.dart';
import 'package:learning_app/features/register/register_screen.dart';
import 'package:learning_app/features/welcome/welcome.dart';
import 'package:learning_app/global.dart';

class RouteGenerator {

  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.initial:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case AppRoutes.app:
        return MaterialPageRoute(builder: (_) => const ApplicationScreen());
      case AppRoutes.loginRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case AppRoutes.registerScreen:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text("No Route Found"),
        ),
        body: const Center(
          child: Text("No Route Found"),
        ),
      ),
    );
  }
}
