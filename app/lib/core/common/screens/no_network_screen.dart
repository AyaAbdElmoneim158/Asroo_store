import 'package:app/core/style/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoNetWorkScreen extends StatelessWidget {
  const NoNetWorkScreen({super.key});

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
              'NO Internet :(',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: const Color(0XFF247CFF),
                    fontWeight: FontWeight.w400,
                  ),
            ),
            Text(
              'Please check your internet connection\nyou are in offline now.',
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
