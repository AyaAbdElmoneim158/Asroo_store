import 'package:app/features/auth/presentation/widgets/auth_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../widgets/sign_up/sign_up_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: AuthBottomNavigationBar(),
      body: SignUpBody(),
    );
  }
}
