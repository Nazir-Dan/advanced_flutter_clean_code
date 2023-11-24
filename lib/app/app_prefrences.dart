import 'dart:ui';

import 'package:advanced_flutter_tut/presentation/resources/language_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String PREFS_KEY_LANG = 'PREFS_KEY_LANG';
const String PREFS_KEY_ONBOARDING_SCREEN_VIEWED =
    'PREFS_KEY_ONBOARDING_SCREEN_VIEWED';
const String PREFS_KEY_IS_USER_LOGED_IN = 'PREFS_KEY_IS_USER_LOGED_IN';
const String PREFS_KEY_IS_USER_REGISTERED = 'PREFS_KEY_IS_USER_REGISTERED';

class AppPrefrences {
  final SharedPreferences _sharedPreferences;

  AppPrefrences(this._sharedPreferences);

  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString(PREFS_KEY_LANG);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      //return default lang
      return LanguageType.ENGLISH.getValue();
    }
  }

  Future<void> changeAppLanguage() async {
    String currentLanguage = await getAppLanguage();
    if (currentLanguage == LanguageType.ARABIC.getValue()) {
      //set english
      _sharedPreferences.setString(
          PREFS_KEY_LANG, LanguageType.ENGLISH.getValue());
    } else {
      //set arabic
      _sharedPreferences.setString(
          PREFS_KEY_LANG, LanguageType.ARABIC.getValue());
    }
  }

  Future<Locale> getLocale() async {
    String currentLanguage = await getAppLanguage();
    if (currentLanguage == LanguageType.ARABIC.getValue()) {
      return ARABIC_LOCAL;
    } else {
      return ENGLISH_LOCAL;
    }
  }

  //on boarding
  Future<void> setOnBoardingScreenViewed() async {
    _sharedPreferences.setBool(PREFS_KEY_ONBOARDING_SCREEN_VIEWED, true);
  }

  Future<bool> isOnBoardingScreenViewed() async {
    return _sharedPreferences.getBool(PREFS_KEY_ONBOARDING_SCREEN_VIEWED) ??
        false;
  }

  //Login
  Future<void> setUserLogedIn() async {
    _sharedPreferences.setBool(PREFS_KEY_IS_USER_LOGED_IN, true);
  }

  Future<bool> isUserLogedIn() async {
    return _sharedPreferences.getBool(PREFS_KEY_IS_USER_LOGED_IN) ?? false;
  }

  Future<void> logOut() async {
    _sharedPreferences.remove(PREFS_KEY_IS_USER_LOGED_IN);
    //or
    //_sharedPreferences.setBool(PREFS_KEY_IS_USER_LOGED_IN, false);
  }
}
