import 'package:flutter/material.dart';
import 'package:quick_shop/core/themes/my_themes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  Future<void> saveTheme(String theme) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', theme);
  }

//   Future<ThemeData> getTheme() async {
//     final brightness =
//         WidgetsBinding.instance.platformDispatcher.platformBrightness;
//     final prefs = await SharedPreferences.getInstance();
//     final theme = prefs.getString('theme');

//     if (theme == "light") {
//     //  return MyThemes.customLightTheme;
//     } else if (theme == "dark") {
//  //     return MyThemes.customDarkTheme;
//     } else {
//       if (brightness != Brightness.dark) {
//     //    return MyThemes.customLightTheme;
//       } else {
//      //   return MyThemes.customDarkTheme;
//       }
//     }
//   }
}

// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:quick_shop/utiles/themes/my_themes.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:get/get.dart';

// class ThemeController extends GetxController {
//   // استخدام Rx لتتبع الثيم الحالي
//   var currentTheme = MyThemes.customLightTheme.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     // جلب الثيم المحفوظ وتحديث Rx
//     loadTheme();
//   }

//   Future<void> saveTheme(String theme) async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       await prefs.setString('theme', theme);
//       // تحديث الثيم مباشرة
//       if (theme == "light") {
//         currentTheme.value = MyThemes.customLightTheme;
//       } else {
//         currentTheme.value = MyThemes.customDarkTheme;
//       }
//       Get.changeTheme(currentTheme.value);
//     } catch (e) {
//       log('Error saving theme: $e');
//     }
//   }

//   Future<void> loadTheme() async {
//     try {
//       final brightness =
//           WidgetsBinding.instance.platformDispatcher.platformBrightness;
//       final prefs = await SharedPreferences.getInstance();
//       final theme = prefs.getString('theme');

//       if (theme == "light") {
//         currentTheme.value = MyThemes.customLightTheme;
//       } else if (theme == "dark") {
//         currentTheme.value = MyThemes.customDarkTheme;
//       } else {
//         currentTheme.value =
//             brightness == Brightness.dark ? MyThemes.customDarkTheme : MyThemes.customLightTheme;
//       }

//       // تطبيق الثيم عند التحميل
//       Get.changeTheme(currentTheme.value);
//     } catch (e) {
//       log('Error loading theme: $e');
//     }
//   }
// }
