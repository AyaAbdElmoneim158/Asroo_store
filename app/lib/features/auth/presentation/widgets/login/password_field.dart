import 'package:flutter/material.dart';
import '../../../../../core/common/widgets/custom_text_field.dart';
import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/utils/animation/animate_do.dart';
import '../../../../../core/utils/app_regex.dart';
import '../../../../../core/utils/extensions/context_extension.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    required this.controller,
    required this.toggleVisibility,
    super.key,
  });
  final TextEditingController controller;
  final VoidCallback toggleVisibility;

  @override
  // ignore: library_private_types_in_public_api
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isShowPassword = true;

  @override
  Widget build(BuildContext context) {
    return CustomFadeInRight(
      duration: 200,
      child: CustomTextField(
        controller: widget.controller,
        hintText: context.translate(LangKeys.password),
        keyboardType: TextInputType.visiblePassword,
        obscureText: isShowPassword,
        validator: (value) {
          if (!AppRegex.isPasswordValid(value ?? widget.controller.text)) {
            return context.translate(LangKeys.validPassword);
          }
          return null;
        },
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              isShowPassword = !isShowPassword;
            });
            widget.toggleVisibility();
          },
          icon: Icon(
            isShowPassword ? Icons.visibility_off : Icons.visibility,
            color: context.color.textColor,
          ),
        ),
      ),
    );
  }
}
