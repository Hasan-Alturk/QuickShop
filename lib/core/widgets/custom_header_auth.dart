import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_constants.dart';
import 'package:quick_shop/core/constants/app_text_styles.dart';

class CustomHeaderAuth extends StatelessWidget {
  const CustomHeaderAuth({
    super.key,
    required this.title,
    required this.image,
  });
  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.colorScheme.secondary,
      appBar: AppBar(
        backgroundColor: Get.theme.colorScheme.secondary,
        iconTheme: IconThemeData(
          color: Get.theme.colorScheme.onPrimary,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 75),
          child: Column(
            children: [
              SvgPicture.asset(
                image,
                fit: BoxFit.cover,
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                title,
                style: AppTextStyles().semiBold24().copyWith(
                      color: Get.theme.colorScheme.onPrimary,
                    ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
