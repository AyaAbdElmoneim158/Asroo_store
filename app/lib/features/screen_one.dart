import 'package:app/core/routing/app_routes.dart';
import 'package:app/core/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text('Screen one'),
            ElevatedButton(
              onPressed: () {
                context.pushName(AppRoutes.screenTwo);
              },
              child: const Text('Go to two screen'),
            ),
          ],
        ),
      ),
    );
  }
}
