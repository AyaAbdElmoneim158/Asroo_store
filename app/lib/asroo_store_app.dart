import 'package:app/core/app/connectivity_controller.dart';
import 'package:app/core/app/env.variables.dart';
import 'package:app/core/common/screens/no_network_screen.dart';
import 'package:app/core/routing/app_routes.dart';
import 'package:app/core/utils/style/fonts/font_family_helper.dart';
import 'package:app/core/utils/style/fonts/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/theme/app_theme.dart';

class AsrooStoreApp extends StatelessWidget {
  const AsrooStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ConnectivityController.instance.isConnected,
      builder: (_, value, __) {
        if (value) {
          return ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            child: MaterialApp(
              title: 'Asroo Store',
              debugShowCheckedModeBanner: EnvVariable.instance.debugMode,
              // Routing - - - - - - - - - - - - - - - - - - - - - - - - - - -
              onGenerateRoute: AppRoutes.onGenerateRoute,
              initialRoute: AppRoutes.screenOne,
              // Theming - - - - - - - - - - - - - - - - - - - - - - - - - - -
              theme: themeDark(),
              // Builder - - - - - - - - - - - - - - - - - - - - - - - - - - -
              builder: (context, widget) {
                return GestureDetector(
                  onTap: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: Scaffold(
                    body: Builder(
                      builder: (context) {
                        ConnectivityController.instance.init();
                        return widget!;
                      },
                    ),
                  ),
                );
              },
              home: Scaffold(
                appBar: AppBar(title: const Text('Asroo Store')),
                body: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Asroo Store',
                          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: const Color(0XFF247CFF),
                                fontWeight: FontWeightHelper.bold,
                                fontFamily: FontFamilyHelper.poppinsEnglish,
                              ),
                        ),
                        Text(
                          'Asroo Store',
                          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: const Color(0XFF247CFF),
                                fontWeight: FontWeightHelper.bold,
                              ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'أسرا',
                          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: const Color(0XFF247CFF),
                                fontWeight: FontWeightHelper.bold,
                                fontFamily: FontFamilyHelper.cairoArabic,
                              ),
                        ),
                        Text(
                          'أسرا',
                          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: const Color(0XFF247CFF),
                                fontWeight: FontWeightHelper.bold,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return MaterialApp(
            title: 'No NetWork ',
            debugShowCheckedModeBanner: EnvVariable.instance.debugMode,
            home: const NoNetWorkScreen(),
          );
        }
      },
    );
  }
}
