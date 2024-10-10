import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quick_shop/core/constants/app_colors.dart';
import 'package:quick_shop/core/constants/app_text_styles.dart';

class CustomHeaderAuth extends StatelessWidget {
  const CustomHeaderAuth({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
  });
  final String image;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkColor,
      // appBar: AppBar(
      //   backgroundColor: AppColors.darkColor,
      //   iconTheme: const IconThemeData(
      //     color: AppColors.whiteColor,
      //   ),
      // ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 75),
          child: Column(
            children: [
              const SizedBox(height: 25),
              SvgPicture.asset(
                image,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              Text(
                title,
                style: AppTextStyles().semiBold24(context).copyWith(
                      color: AppColors.whiteColor,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                subTitle,
                style: AppTextStyles().medium12(context).copyWith(
                      color: AppColors.nonActiveColor,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
