import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_colors.dart';
import 'package:quick_shop/core/constants/app_images.dart';
import 'package:quick_shop/views/splash/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        children: [
          Container(
            height: height,
            width: width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.imagesSplach),
                repeat: ImageRepeat.repeat,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() => Opacity(
                      opacity: controller.fadeAnimation.value,
                      child: Transform.scale(
                        scale: controller.scaleAnimation.value,
                        child: SvgPicture.asset(Assets.imagesLogoWhite),
                      ),
                    )),
                SizedBox(height: height * 0.05),
                const CircularProgressIndicator(
                  strokeWidth: 3,
                  color: AppColors.whiteColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
