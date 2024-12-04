import 'package:app/core/common/screens/under_build_screen.dart';
import 'package:app/core/routing/base_routes.dart';
import 'package:app/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/admin/home_admin.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../features/auth/presentation/screens/sign_up_screen.dart';
import '../../features/customer/home_customer.dart';
import '../di/injection_container.dart';

class AppRoutes {
  static const String login = 'login';
  static const String signUp = 'signUp';
  static const String homeAdmin = 'homeAdmin';
  static const String mainCustomer = 'mainCustomer';

  static Route<void> onGenerateRoute(RouteSettings settings) {
    // final args = settings.arguments;
    switch (settings.name) {
      case login:
        return BaseRoute(
          page: BlocProvider(
            create: (context) => sl<AuthBloc>(),
            child: const LoginScreen(),
          ),
        );
      case signUp:
        return BaseRoute(page: const SignUpScreen());

      case homeAdmin:
        return BaseRoute(page: const HomeAdmin());

      case mainCustomer:
        return BaseRoute(page: const HomeCustomer());

      default:
        return BaseRoute(page: const PageUnderBuildScreen());
    }
  }
}
