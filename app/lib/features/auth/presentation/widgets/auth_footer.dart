import 'package:app/core/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/widgets/text_app.dart';
import '../../../../core/utils/animation/animate_do.dart';
import '../../../../core/utils/style/fonts/font_weight_helper.dart';

class AuthFooter extends StatelessWidget {
  const AuthFooter({
    required this.footerText,
    super.key,
    this.onPressed,
  });
  final String footerText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomFadeInDown(
      duration: 400,
      child: TextButton(
        onPressed: onPressed,
        child: TextApp(
          text: context.translate(footerText),
          theme: context.textStyle.copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeightHelper.bold,
            color: context.color.bluePinkLight,
          ),
        ),
      ),
    );
  }
}
