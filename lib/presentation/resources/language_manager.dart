import 'package:flutter/material.dart';

enum LanguageType { ARABIC, ENGLISH }

const String ARABIC = "ar";
const String ENGLISH = "en";
const String ASSET_PATH_LOCALISATIONS = "assets/translation";
const Locale ARABIC_LOCAL = Locale("ar", "SA");
const Locale ENGLISH_LOCAL = Locale("en", "US");

extension LanguageTypeExtension on LanguageType {
  String getLanguage() {
    switch (this) {
      case LanguageType.ARABIC:
        return ARABIC;
      case LanguageType.ENGLISH:
        return ENGLISH;
    }
  }
}
