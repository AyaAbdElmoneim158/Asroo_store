import 'package:app/core/common/screens/under_build_screen.dart';
import 'package:app/core/routing/base_routes.dart';
import 'package:app/features/screen_one.dart';
import 'package:app/features/screen_two.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String screenOne = 'screenOne';
  static const String screenTwo = 'screenTwo';

  static Route<void> onGenerateRoute(RouteSettings settings) {
    // final args = settings.arguments;
    switch (settings.name) {
      case screenOne:
        return BaseRoute(page: const ScreenOne());
      case screenTwo:
        return BaseRoute(page: const ScreenTwo());

      default:
        return BaseRoute(page: const PageUnderBuildScreen());
    }
  }
}
