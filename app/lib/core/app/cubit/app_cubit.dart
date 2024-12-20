import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utils/services/shared_pref/pref_keys.dart';
import '../../utils/services/shared_pref/shared_pref.dart';

part 'app_cubit.freezed.dart';
part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState.initial());
  static AppCubit of(BuildContext context) => BlocProvider.of<AppCubit>(context);

  bool isDark = true;
  String currentLangCode = 'en';

  //! Theme Mode - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  Future<void> changeAppThemeMode({bool? sharedMode}) async {
    if (sharedMode != null) {
      isDark = sharedMode;
      emit(AppState.themeChangeMode(isDark: isDark));
    } else {
      isDark = !isDark;
      await SharedPref().setBoolean(PrefKeys.themeMode, isDark).then((value) {
        emit(AppState.themeChangeMode(isDark: isDark));
      });
    }
  }

  //! Language Change - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  void getSavedLanguage() {
    final result = SharedPref().containPreference(PrefKeys.language) ? SharedPref().getString(PrefKeys.language) : 'en';
    currentLangCode = result!;
    emit(AppState.languageChange(locale: Locale(currentLangCode)));
  }

  Future<void> _changeLang(String langCode) async {
    await SharedPref().setString(PrefKeys.language, langCode);
    currentLangCode = langCode;
    emit(AppState.languageChange(locale: Locale(currentLangCode)));
  }

  void toArabic() => _changeLang('ar');
  void toEnglish() => _changeLang('en');
}
