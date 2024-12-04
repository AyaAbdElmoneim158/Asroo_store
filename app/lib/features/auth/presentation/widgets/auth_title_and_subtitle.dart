import 'package:app/core/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/widgets/text_app.dart';
import '../../../../../core/utils/style/fonts/font_weight_helper.dart';
import '../../../../core/utils/animation/animate_do.dart';

class AuthTitleAndSubtitle extends StatelessWidget {
  const AuthTitleAndSubtitle({
    required this.title,
    required this.subtitle,
    super.key,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return CustomFadeInDown(
      duration: 400,
      child: Column(
        children: [
          _buildTitle(context),
          SizedBox(height: 10.h),
          _buildSubtitle(context),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return TextApp(
      text: title,
      theme: _getTextStyle(
        context: context,
        fontSize: 24.sp,
        fontWeight: FontWeightHelper.bold,
      ),
    );
  }

  Widget _buildSubtitle(BuildContext context) {
    return TextApp(
      text: subtitle,
      theme: _getTextStyle(
        context: context,
        fontSize: 16.sp,
        fontWeight: FontWeightHelper.medium,
      ),
      textAlign: TextAlign.center,
    );
  }

  TextStyle _getTextStyle({
    required BuildContext context,
    required double fontSize,
    required FontWeight fontWeight,
  }) {
    return context.textStyle.copyWith(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: context.color.textColor,
    );
  }
}
