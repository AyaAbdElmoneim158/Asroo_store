import 'package:app/core/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/widgets/custom_linear_button.dart';
import '../../../../../core/common/widgets/text_app.dart';
import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/utils/animation/animate_do.dart';
import '../../../../../core/utils/style/fonts/font_weight_helper.dart';

class ThemeAndLangButtons extends StatelessWidget {
  const ThemeAndLangButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildThemeButton(context),
        _buildLanguageButton(context),
      ],
    );
  }

  Widget _buildThemeButton(BuildContext context) {
    return CustomFadeInRight(
      duration: 400,
      child: CustomLinearButton(
        onPressed: () {
          // Add theme toggle functionality here
        },
        child: const Icon(
          Icons.dark_mode_rounded,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildLanguageButton(BuildContext context) {
    return CustomFadeInLeft(
      duration: 400,
      child: CustomLinearButton(
        onPressed: () {
          // Add language change functionality here
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
