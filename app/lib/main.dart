import 'package:app/asroo_store_app.dart';
import 'package:app/core/app/env.variables.dart';
import 'package:app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/app/bloc_observer.dart';
import 'core/di/injection_container.dart';
import 'core/utils/services/shared_pref/shared_pref.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EnvVariable.instance.init(envType: EnvType.dev);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await SharedPref().instantiatePreferences();
  await setupInjector();
  Bloc.observer = AppBlocObserver();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
  ).then(
    (_) => runApp(
      const AsrooStoreApp(),
    ),
  );
}
