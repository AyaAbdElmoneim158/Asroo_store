import 'package:app/core/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import '../../../../../core/common/screens/screen_scroll_body.dart';
import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/routing/app_routes.dart';
import '../auth_footer.dart';
import '../auth_title_and_subtitle.dart';
import 'login_form.dart';
import 'theme_and_lang_buttons.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenScrollBody(
      children: [
        const ThemeAndLangButtons(),
        AuthTitleAndSubtitle(
          title: context.translate(LangKeys.login),
          subtitle: context.translate(LangKeys.welcome),
        ),
        const LoginForm(),
        AuthFooter(
          footerText: LangKeys.youHaveAccount,
          onPressed: () => context.pushName(AppRoutes.login),
        ),
      ],
    );
  }
}
