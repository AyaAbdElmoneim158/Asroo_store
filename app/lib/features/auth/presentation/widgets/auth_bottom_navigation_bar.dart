import 'package:app/core/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'auth_custom_painter.dart';

class AuthBottomNavigationBar extends StatelessWidget {
  const AuthBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(MediaQuery.of(context).size.width, 150.h),
      painter: AuthCustomPainter(
        gradient: LinearGradient(
          colors: [
            context.color.bluePinkLight!,
            context.color.bluePinkLight!,
            context.color.bluePinkLight!,
            context.color.bluePinkDark!,
          ],
        ),
      ),
    );
  }
}
