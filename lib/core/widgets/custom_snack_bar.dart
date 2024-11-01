import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_constants.dart';

class CustomSnackbar {
  static void showErrorSnackbar(String message) {
    Get.snackbar(
      'Error', // عنوان الرسالة
      titleText: Text(
        'Error',
        style: TextStyle(
          color: Get.theme.colorScheme.onPrimary,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      message, // محتوى الرسالة
      messageText: Text(
        message,
        style: TextStyle(
          color: Get.theme.scaffoldBackgroundColor,
          fontWeight: FontWeight.normal,
          fontSize: 14,
        ),
      ),
      snackPosition: SnackPosition.TOP, // مكان عرض الرسالة
      backgroundColor: Get.theme.colorScheme.secondary,
      colorText: Get.theme.colorScheme.onPrimary, // لون النص
      borderRadius: 32, // لتدوير الحواف
      margin: const EdgeInsets.all(screenPadding), // هامش من كل الجوانب
      padding: const EdgeInsets.all(screenPadding), // مسافات داخلية أكبر
      animationDuration: Duration(milliseconds: 200),
      duration: Duration(seconds: 3), // مدة عرض الإشعار
      forwardAnimationCurve: Curves.linear,
      reverseAnimationCurve: Curves.linear,
      backgroundGradient: LinearGradient(
        colors: [
          Get.theme.colorScheme.secondary,
          Get.theme.colorScheme.onError
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      icon: Icon(
        Icons.warning_rounded,
        color: Get.theme.colorScheme.onPrimary,
        size: 40,
      ),
      shouldIconPulse: true,
    );
  }

  static void showSuccessSnackbar(String message) {
    Get.snackbar(
      'Success', // عنوان الرسالة
      titleText: Text(
        'Success',
        style: TextStyle(
          color: Get.theme.colorScheme.onPrimary,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      message, // محتوى الرسالة
      messageText: Text(
        message,
        style: TextStyle(
          color: Get.theme.scaffoldBackgroundColor,
          fontWeight: FontWeight.normal,
          fontSize: 14,
        ),
      ),
      snackPosition: SnackPosition.TOP, // مكان عرض الرسالة
      backgroundColor: Get.theme.colorScheme.secondary,
      colorText: Get.theme.colorScheme.onPrimary, // لون النص
      borderRadius: 32, // لتدوير الحواف
      margin: const EdgeInsets.all(screenPadding), // هامش من كل الجوانب
      padding: const EdgeInsets.all(screenPadding), // مسافات داخلية أكبر
      animationDuration: const Duration(milliseconds: 200),
      duration: const Duration(seconds: 3), // مدة عرض الإشعار
      forwardAnimationCurve: Curves.linear,
      reverseAnimationCurve: Curves.linear,

      backgroundGradient: LinearGradient(
        colors: [Get.theme.colorScheme.secondary, Colors.green],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      icon: Icon(
        Icons.warning_rounded,
        color: Get.theme.colorScheme.onPrimary,
        size: 40,
      ),
      shouldIconPulse: true,
    );
  }
}
