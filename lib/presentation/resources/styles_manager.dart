import 'package:advanced_flutter_tut/presentation/resources/font_manager.dart';
import 'package:flutter/material.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
    fontFamily: FontConstants.fontFamily,
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}

//regular style

TextStyle getRegularStyle(
    {required Color color, double fontSize = FontSizeManager.s12}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color);
}
//medium style

TextStyle getMediumStyle(
    {required Color color, double fontSize = FontSizeManager.s12}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color);
}
//light style

TextStyle getLightStyle(
    {required Color color, double fontSize = FontSizeManager.s12}) {
  return _getTextStyle(fontSize, FontWeightManager.light, color);
}
//semiBold style

TextStyle getSemiBoldStyle(
    {required Color color, double fontSize = FontSizeManager.s12}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color);
}
//bold style

TextStyle getBoldStyle(
    {required Color color, double fontSize = FontSizeManager.s12}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color);
}
