import 'package:app/features/auth/presentation/widgets/auth_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../widgets/login/login_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: AuthBottomNavigationBar(),
      body: LoginBody(),
    );
  }
}
