import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quick_shop/core/themes/my_themes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  Future<void> saveTheme(String theme) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', theme);
  }

  Future<ThemeData> getTheme() async {
    final Brightness brightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;

    log(brightness.toString());
    final prefs = await SharedPreferences.getInstance();
    final theme = prefs.getString('theme');

    if (theme == "light") {
      return MyThemes.customLightTheme();
    } else if (theme == "dark") {
      return MyThemes.customDarkTheme();
    } else {
      if (brightness == Brightness.dark) {
        return MyThemes.customDarkTheme();
      } else {
        return MyThemes.customLightTheme();
      }
    }
  }
}
