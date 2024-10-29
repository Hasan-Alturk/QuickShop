import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/models/user.dart';
import 'package:quick_shop/core/themes/my_themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static late SharedPreferences prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  // save Locale
  static Future<void> saveLocale(String locale) async {
    await prefs.setString("language", locale);
  }

  // Get Locale
  static Future<Locale?> getLocale() async {
    try {
      final locale = prefs.getString("language");
      return locale != null ? Locale(locale) : Get.deviceLocale;
    } catch (e) {
      return Get.deviceLocale;
    }
  }

  // Save Theme
  static Future<void> saveTheme(String theme) async {
    await prefs.setString("theme", theme);
  }

  // get Theme
  static Future<ThemeData> getTheme() async {
    return MyThemes.customLightTheme();
    // try {
    //   final Brightness brightness =
    //       WidgetsBinding.instance.platformDispatcher.platformBrightness;
    //   final theme = prefs.getString("theme");

    //   if (theme == "light") {
    //     return MyThemes.customLightTheme();
    //   } else if (theme == "dark") {
    //     return MyThemes.customDarkTheme();
    //   } else {
    //     return brightness == Brightness.dark
    //         ? MyThemes.customDarkTheme()
    //         : MyThemes.customLightTheme();
    //   }
    // } catch (e) {
    //   return MyThemes.customLightTheme();
    // }
  }

  // Save Token
  static Future<void> saveToken({required String token}) async {
    await prefs.setString('token', "Bearer $token");
  }

  // get Token from SharedPreferences
  static Future<String?> getToken() async {
    String? token = prefs.getString('token');
    return token;
  }

  // Save User in SharedPreferences

  static Future<void> saveUser(User user) async {
    prefs.setString('user', jsonEncode(user.toJson()));
  }

  // get User from SharedPreferences

  static Future<User?> getUser() async {
    String? userString = prefs.getString('user');
    if (userString == null) {
      return null;
    }
    Map<String, dynamic> user = jsonDecode(userString);
    return User.fromJson(user);
  }
}
