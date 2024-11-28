import 'package:app/core/style/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageUnderBuildScreen extends StatelessWidget {
  const PageUnderBuildScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.noNetwork,
              fit: BoxFit.cover,
              height: 64.h,
            ),
            SizedBox(height: 16.h),
            Text(
              'Under Construction',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: const Color(0XFF247CFF),
                    fontWeight: FontWeight.w400,
                  ),
            ),
            Text(
              "Sorry for the inconvenience but we're performing some maintenance at the moment.",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: const Color(0xFF83839c),
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
