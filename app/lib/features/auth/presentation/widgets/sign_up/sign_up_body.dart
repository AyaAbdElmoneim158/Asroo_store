import 'package:app/core/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import '../../../../../core/common/screens/screen_scroll_body.dart';
import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/routing/app_routes.dart';
import '../auth_footer.dart';
import '../auth_title_and_subtitle.dart';
import '../login/theme_and_lang_buttons.dart';
import 'sign_up_form.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenScrollBody(
      children: [
        const ThemeAndLangButtons(),
        AuthTitleAndSubtitle(
          title: context.translate(LangKeys.signUp),
          subtitle: context.translate(LangKeys.signUpWelcome),
        ),
        const SignUpForm(),
        AuthFooter(
          footerText: LangKeys.createAccount,
          onPressed: () => context.pushReplacementNamed(AppRoutes.signUp),
        ),
      ],
    );
  }
}
