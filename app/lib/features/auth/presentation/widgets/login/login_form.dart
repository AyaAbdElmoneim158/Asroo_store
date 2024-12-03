import 'package:app/core/common/widgets/custom_text_field.dart';
import 'package:app/core/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/widgets/custom_linear_button.dart';
import '../../../../../core/common/widgets/text_app.dart';
import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/utils/animation/animate_do.dart';
import '../../../../../core/utils/app_regex.dart';
import '../../../../../core/utils/style/fonts/font_weight_helper.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isShowPassword = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          _buildEmailField(context),
          SizedBox(height: 25.h),
          _buildPasswordField(context),
          SizedBox(height: 25.h),
          _buildLoginButton(context),
        ],
      ),
    );
  }

  CustomLinearButton _buildLoginButton(BuildContext context) {
    return CustomLinearButton(
      onPressed: () {},
      height: 50.h,
      width: MediaQuery.of(context).size.width,
      child: TextApp(
        text: context.translate(LangKeys.login),
        theme: context.textStyle.copyWith(
          fontSize: 18.sp,
          fontWeight: FontWeightHelper.bold,
        ),
      ),
    );
  }

  Widget _buildEmailField(BuildContext context) {
    return CustomFadeInRight(
      duration: 200,
      child: CustomTextField(
        controller: emailController,
        hintText: context.translate(LangKeys.email),
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (!AppRegex.isEmailValid(value ?? '')) {
            return context.translate(LangKeys.validEmail);
          }
          return null;
        },
      ),
    );
  }

  Widget _buildPasswordField(BuildContext context) {
    return CustomFadeInRight(
      duration: 200,
      child: CustomTextField(
        controller: passwordController,
        hintText: context.translate(LangKeys.password),
        keyboardType: TextInputType.visiblePassword,
        obscureText: isShowPassword,
        validator: (value) {
          if (!AppRegex.isPasswordValid(value ?? '')) {
            return context.translate(LangKeys.validPassword);
          }
          return null;
        },
        suffixIcon: IconButton(
          onPressed: _togglePasswordVisibility,
          icon: Icon(
            isShowPassword ? Icons.visibility_off : Icons.visibility,
            color: context.color.textColor,
          ),
        ),
      ),
    );
  }

  void _togglePasswordVisibility() {
    setState(() {
      isShowPassword = !isShowPassword;
    });
  }
}
