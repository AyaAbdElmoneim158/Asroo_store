import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../bloc/auth_bloc.dart';
import 'email_field.dart';
import 'login_button.dart';
import 'password_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late AuthBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<AuthBloc>();
  }

  @override
  void dispose() {
    _bloc.emailController.dispose();
    _bloc.passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _bloc.formKey,
      child: Column(
        children: [
          const EmailField(),
          SizedBox(height: 25.h),
          PasswordField(
            controller: _bloc.passwordController,
            toggleVisibility: () => setState(() {}),
          ),
          SizedBox(height: 25.h),
          const LoginButton(),
        ],
      ),
    );
  }
}
