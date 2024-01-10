// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ru = {
  "welcome": " Добро пожаловать",
  "key": " Привет"
};
static const Map<String,dynamic> en = {
  "welcome": "Welcome",
  "key": "Hello"
};
static const Map<String,dynamic> uz = {
  "welcome": " Xush kelibsiz",
  "wel": " Assalomu Alaykum"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ru": ru, "en": en, "uz": uz};
}
