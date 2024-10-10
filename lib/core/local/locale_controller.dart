import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  Future<void> saveLocale(String locale) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('language', locale);
  }

  Future<Locale?> getLocale() async {
    final prefs = await SharedPreferences.getInstance();

    final locale = prefs.getString('language');

    if (locale != null) {
      return Locale(locale);
    } else {
      return Get.deviceLocale;
    }
  }
}
