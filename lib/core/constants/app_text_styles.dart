import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTextStyles {
  double getResponsiveFontSize({
    required double fontSize,
  }) {
    double scaleFactor = getScaleFactor(Get.context!);
    double responsiveFontSize = fontSize * scaleFactor;

    double lowerLimit = fontSize * 0.95;
    double upperLimit = fontSize * 1.05;

    return responsiveFontSize.clamp(lowerLimit, upperLimit);
  }

  double getScaleFactor(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    if (width < 360) {
      return width / 360;
    } else if (width < 600) {
      return width / 500;
    } else if (width < 900) {
      return width / 800;
    } else {
      return width / 1200;
    }
  }

  // BlackBold
  TextStyle blackBold24() {
    return TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: getResponsiveFontSize(fontSize: 24),
    );
  }

  // SemiBold
  TextStyle semiBold24() {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: getResponsiveFontSize(fontSize: 24),
    );
  }

  TextStyle semiBold16() {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: getResponsiveFontSize(fontSize: 16),
    );
  }

  TextStyle semiBold14() {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: getResponsiveFontSize(fontSize: 14),
    );
  }

  // Bold
  TextStyle bold16() {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: getResponsiveFontSize(fontSize: 16),
    );
  }

  TextStyle bold12() {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: getResponsiveFontSize(fontSize: 12),
    );
  }

  // Medium
  TextStyle medium14() {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: getResponsiveFontSize(fontSize: 14),
    );
  }

  TextStyle medium12() {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: getResponsiveFontSize(fontSize: 12),
    );
  }

  TextStyle medium10() {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: getResponsiveFontSize(fontSize: 10),
    );
  }

  TextStyle medium8() {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: getResponsiveFontSize(fontSize: 8),
    );
  }

  // Regular
  TextStyle regular12() {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: getResponsiveFontSize(fontSize: 12),
    );
  }
}
