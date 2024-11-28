import 'package:app/core/app/connectivity_controller.dart';
import 'package:app/core/app/env.variables.dart';
import 'package:app/core/common/screens/no_network_screen.dart';
import 'package:app/core/language/lang_keys.dart';
import 'package:app/core/routing/app_routes.dart';
import 'package:app/core/utils/extensions/context_extension.dart';
import 'package:app/core/utils/style/fonts/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/language/app_localizations_setup.dart';
import 'core/theme/app_theme.dart';

class AsrooStoreApp extends StatelessWidget {
  const AsrooStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ConnectivityController.instance.isConnected,
      builder: (_, isConnected, __) {
        return isConnected ? _buildMainApp() : _buildNoNetworkApp();
      },
    );
  }

  Widget _buildMainApp() {
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
        // Localization - - - - - - - - - - - - - - - - - - - - - - - - - - -
        locale: const Locale('en'),
        supportedLocales: AppLocalizationsSetup.supportedLocales,
        localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
        localeResolutionCallback: AppLocalizationsSetup.localeResolutionCallback,
        // Builder - - - - - - - - - - - - - - - - - - - - - - - - - - -
        builder: (context, widget) => GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            body: Builder(
              builder: (context) {
                ConnectivityController.instance.init();
                return widget!;
              },
            ),
          ),
        ),
        home: _buildHomeScreen(),
      ),
    );
  }

  Widget _buildNoNetworkApp() {
    return MaterialApp(
      title: 'No Network',
      debugShowCheckedModeBanner: EnvVariable.instance.debugMode,
      home: const NoNetWorkScreen(),
    );
  }

  Widget _buildHomeScreen() {
    return Scaffold(
      appBar: AppBar(title: const Text('Asroo Store')),
      body: Column(
        children: [
          Builder(
            builder: (context) {
              return Text(
                context.translate(LangKeys.appName),
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: context.color.mainColor,
                      fontWeight: FontWeightHelper.bold,
                    ),
              );
            },
          ),
        ],
      ),
    );
  }
}
