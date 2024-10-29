import 'package:flutter/widgets.dart';

const String baseUrl = "https://khd.kankfyha.com";

double screenPadding = 16;

extension MediaQueryValues on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;
}
