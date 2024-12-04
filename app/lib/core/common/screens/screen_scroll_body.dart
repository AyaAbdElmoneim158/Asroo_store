import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenScrollBody extends StatelessWidget {
  const ScreenScrollBody({super.key, this.children = const <Widget>[]});

  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: SingleChildScrollView(
        child: Column(children: children),
      ),
    );
  }
}
