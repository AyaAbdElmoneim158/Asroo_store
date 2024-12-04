import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/common/widgets/custom_text_field.dart';
import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/utils/animation/animate_do.dart';
import '../../../../../core/utils/app_regex.dart';
import '../../../../../core/utils/extensions/context_extension.dart';
import '../../bloc/auth_bloc.dart';

class EmailField extends StatelessWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AuthBloc>();

    return CustomFadeInRight(
      duration: 200,
      child: CustomTextField(
        controller: bloc.emailController,
        hintText: context.translate(LangKeys.email),
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (!AppRegex.isEmailValid(value ?? bloc.emailController.text)) {
            return context.translate(LangKeys.validEmail);
          }
          return null;
        },
      ),
    );
  }
}
