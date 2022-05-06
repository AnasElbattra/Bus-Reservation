import 'package:flutter/material.dart';
import 'package:gobusss/presentation/resources/color_manager.dart';
import 'package:gobusss/presentation/resources/font_manager.dart';
import 'package:gobusss/presentation/resources/style_manager.dart';
import 'package:gobusss/presentation/resources/values_manager.dart';

ThemeData getThemeData() {
  return ThemeData(
    textTheme: TextTheme(
      bodyMedium: getRegularStyle(
        color: ColorManager.primary,
        fontSize: FontSize.f16,

      ),


    ),
    appBarTheme: AppBarTheme(
      color: ColorManager.primary,
      elevation: SizeManager.s0,
      centerTitle: true,
      foregroundColor: ColorManager.white,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: SizeManager.s4,
        selectedItemColor: ColorManager.deepOrange,
        unselectedItemColor: ColorManager.darkGrey,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        backgroundColor: ColorManager.outLineField,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: getLightStyle(
            color: ColorManager.Orange50, fontSize: FontSize.f12)),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: ColorManager.primary,
        elevation: SizeManager.s4,
      ),
    ),
  );
}
