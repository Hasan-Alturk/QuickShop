import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_text_styles.dart';
import 'package:quick_shop/core/constants/assets.dart';
import 'package:quick_shop/core/services/plugin_media_que.dart';

class HeaderAuth extends StatelessWidget {
  const HeaderAuth({
    super.key,
    required this.title,
  });
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
                Assets.imagesLogoWhiteSmall,
                fit: BoxFit.cover,
              ),
              SizedBox(height: context.screenHeight * 0.02),
              Text(
                title,
                maxLines: 2,
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
