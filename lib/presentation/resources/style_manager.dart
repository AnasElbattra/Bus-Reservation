import 'package:flutter/material.dart';
import 'package:gobusss/presentation/resources/font_manager.dart';
TextStyle _getTextStyle(FontWeight fontWeight, Color color, double fontSize) {
  return TextStyle(
    color: color,
    fontFamily: FontConstant.fontFamily,
    fontWeight: fontWeight,
    fontSize: fontSize,
  );
}

TextStyle getRegularStyle(
    {double fontSize = FontSize.f12, required Color color}) {
  return _getTextStyle(FontWeightManager.regular, color, fontSize);
}

TextStyle getLightStyle(
    {double fontSize = FontSize.f12, required Color color}) {
  return _getTextStyle(FontWeightManager.light, color, fontSize);
}

TextStyle getMediumStyle(
    {double fontSize = FontSize.f12, required Color color}) {
  return _getTextStyle(FontWeightManager.medium, color, fontSize);
}

TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.f12, required Color color}) {
  return _getTextStyle(FontWeightManager.semiBold, color, fontSize);
}

TextStyle getBoldStyle(
    {double fontSize = FontSize.f12, required Color color}) {
  return _getTextStyle(FontWeightManager.bold, color, fontSize);
}
