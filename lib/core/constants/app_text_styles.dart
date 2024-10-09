import 'package:flutter/material.dart';

class AppTextStyles {
  double getResponsiveFontSize({
    required BuildContext context,
    required double fontSize,
  }) {
    double scaleFactor = getScaleFactor(context);
    double responsiveFontSize = fontSize * scaleFactor;

    double lowerLimit = fontSize * 0.95;
    double upperLimit = fontSize * 1.05;

    return responsiveFontSize.clamp(lowerLimit, upperLimit);
  }

  double getScaleFactor(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    if (width < 600) {
      return width / 500;
    } else if (width < 900) {
      return width / 800;
    } else {
      return width / 1000;
    }
  }

  // BlackBold
  TextStyle blackBold24(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: getResponsiveFontSize(context: context, fontSize: 24),
    );
  }

  // SemiBold
  TextStyle semiBold24(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: getResponsiveFontSize(context: context, fontSize: 24),
    );
  }

  TextStyle semiBold16(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: getResponsiveFontSize(context: context, fontSize: 16),
    );
  }

  TextStyle semiBold14(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: getResponsiveFontSize(context: context, fontSize: 14),
    );
  }

  // Bold
  TextStyle bold16(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: getResponsiveFontSize(context: context, fontSize: 16),
    );
  }

  TextStyle bold12(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: getResponsiveFontSize(context: context, fontSize: 12),
    );
  }

  // Medium
  TextStyle medium14(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: getResponsiveFontSize(context: context, fontSize: 14),
    );
  }

  TextStyle medium12(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: getResponsiveFontSize(context: context, fontSize: 12),
    );
  }

  TextStyle medium10(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: getResponsiveFontSize(context: context, fontSize: 10),
    );
  }

  TextStyle medium8(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: getResponsiveFontSize(context: context, fontSize: 8),
    );
  }

  // Regular
  TextStyle regular12(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: getResponsiveFontSize(context: context, fontSize: 12),
    );
  }
}
