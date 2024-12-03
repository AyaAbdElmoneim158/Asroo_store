import 'package:app/core/common/screens/under_build_screen.dart';
import 'package:app/core/routing/base_routes.dart';
import 'package:app/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';

import '../../features/auth/presentation/screens/sign_up_screen.dart';

class AppRoutes {
  static const String login = 'login';
  static const String signUp = 'signUp';

  static Route<void> onGenerateRoute(RouteSettings settings) {
    // final args = settings.arguments;
    switch (settings.name) {
      case login:
        return BaseRoute(page: const LoginScreen());
      case signUp:
        return BaseRoute(page: const SignUpScreen());

      default:
        return BaseRoute(page: const PageUnderBuildScreen());
    }
  }
}
