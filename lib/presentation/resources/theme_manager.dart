import 'package:advanced_flutter_tut/presentation/resources/color_manager.dart';
import 'package:advanced_flutter_tut/presentation/resources/font_manager.dart';
import 'package:advanced_flutter_tut/presentation/resources/styles_manager.dart';
import 'package:advanced_flutter_tut/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
//main theme
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.lightPrimary, //ripple effect
//cardveiw theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),
//appbar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.white,
      elevation: AppSize.s0,
      shadowColor: ColorManager.lightPrimary,
      titleTextStyle: getRegularStyle(
        color: ColorManager.white,
        fontSize: FontSizeManager.s16,
      ),
    ),
//button theme
    buttonTheme: ButtonThemeData(
      shape: StadiumBorder(),
      disabledColor: ColorManager.grey1,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.lightPrimary,
    ),
    //elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(
          color: ColorManager.white,
          fontSize: FontSizeManager.s17,
        ),
        backgroundColor: ColorManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
      ),
    ),
//text theme
    textTheme: TextTheme(
      displayLarge: getSemiBoldStyle(
        color: ColorManager.darkGrey,
        fontSize: FontSizeManager.s16,
      ),
      headlineLarge: getSemiBoldStyle(
        color: ColorManager.darkGrey,
        fontSize: FontSizeManager.s16,
      ),
      headlineMedium: getSemiBoldStyle(
        color: ColorManager.darkGrey,
        fontSize: FontSizeManager.s14,
      ),
      titleMedium: getMediumStyle(
        color: ColorManager.primary,
        fontSize: FontSizeManager.s16,
      ),
      titleSmall: getRegularStyle(
        color: ColorManager.white,
        fontSize: FontSizeManager.s16,
      ),
      labelSmall: getBoldStyle(
        color: ColorManager.primary,
        fontSize: FontSizeManager.s16,
      ),
      bodyLarge: getMediumStyle(
          color: ColorManager.lightGrey, fontSize: FontSizeManager.s14),
      bodyMedium: getRegularStyle(
          color: ColorManager.lightGrey, fontSize: FontSizeManager.s14),
      bodySmall: getRegularStyle(
          color: ColorManager.grey2, fontSize: FontSizeManager.s12),
    ),
//input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(AppPadding.p8),
      hintStyle: getRegularStyle(
        color: ColorManager.grey,
        fontSize: FontSizeManager.s14,
      ),
      labelStyle: getMediumStyle(
        color: ColorManager.grey,
        fontSize: FontSizeManager.s14,
      ),
      errorStyle: getRegularStyle(
        color: ColorManager.error,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.grey,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.primary,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.error,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.primary,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
    ),
  );
}
