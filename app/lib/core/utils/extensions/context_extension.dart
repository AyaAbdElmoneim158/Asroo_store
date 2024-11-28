import 'package:flutter/material.dart';

import '../../language/app_localizations.dart';
import '../../theme/assets_extension.dart';
import '../../theme/color_extension.dart';

extension ContextExt on BuildContext {
  // Navigation - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  Future<dynamic> pushName(String routeName, {Object? arguments}) =>
      Navigator.of(this).pushNamed(routeName, arguments: arguments);

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) =>
      Navigator.of(this).pushReplacementNamed(routeName, arguments: arguments);

  Future<dynamic> pushNamedAndRemoveUntil(String routeName, {Object? arguments}) =>
      Navigator.of(this).pushNamedAndRemoveUntil(routeName, (route) => false);

  void pop() => Navigator.of(this).pop();

  // Colors - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  MyColors get color => Theme.of(this).extension<MyColors>()!;

  // Images - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  MyAssets get assets => Theme.of(this).extension<MyAssets>()!;

  // Style - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  TextStyle get textStyle => Theme.of(this).textTheme.displaySmall!;

  // Language - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  String translate(String langKey) {
    return AppLocalizations.of(this)!.translate(langKey).toString();
  }
}
