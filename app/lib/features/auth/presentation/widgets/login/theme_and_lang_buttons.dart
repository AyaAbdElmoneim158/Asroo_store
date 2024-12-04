import 'package:app/core/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/app/cubit/app_cubit.dart';
import '../../../../../core/common/widgets/custom_linear_button.dart';
import '../../../../../core/common/widgets/text_app.dart';
import '../../../../../core/language/app_localizations.dart';
import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/utils/animation/animate_do.dart';
import '../../../../../core/utils/style/fonts/font_weight_helper.dart';

class ThemeAndLangButtons extends StatelessWidget {
  const ThemeAndLangButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        final appCubit = AppCubit.of(context);

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildThemeButton(context, appCubit),
            _buildLanguageButton(context, appCubit),
          ],
        );
      },
    );
  }

  Widget _buildThemeButton(BuildContext context, AppCubit appCubit) {
    return CustomFadeInRight(
      duration: 400,
      child: CustomLinearButton(
        onPressed: () => appCubit.changeAppThemeMode,
        child: Icon(
          appCubit.isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildLanguageButton(BuildContext context, AppCubit appCubit) {
    return CustomFadeInLeft(
      duration: 400,
      child: CustomLinearButton(
        onPressed: () {
          if (AppLocalizations.of(context)!.isEnLocale) {
            appCubit.toArabic();
          } else {
            appCubit.toEnglish();
          }
        },
        child: TextApp(
          text: context.translate(LangKeys.language),
          theme: context.textStyle.copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeightHelper.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
