import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pushy_flutter/web/js_fallback.js';
import 'package:quick_shop/core/constants/app_constants.dart';
import 'package:quick_shop/core/constants/app_text_styles.dart';
import 'package:quick_shop/core/widgets/custom_rating.dart';
import 'package:quick_shop/core/services/plugin_media_que.dart';

class CustomCardProduct extends StatelessWidget {
  const CustomCardProduct({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.originalPrice,
    required this.onTap,
    this.discountedPrice,
    this.rating = 3.5,
  });

  final String image;
  final String title;
  final String description;
  final String originalPrice;
  final String? discountedPrice;
  final double rating;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          color: Get.theme.colorScheme.surface,
        ),
        child: Stack(
          children: [
            Column(
              children: [
                _buildProductImage(context),
                _buildProductDetails(context),
              ],
            ),
            _buildFavoriteButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildProductImage(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
      child: Image.asset(
        image,
        fit: BoxFit.cover,
        height: context.screenHeight * 0.22,
        width: double.infinity,
      ),
    );
  }

  Widget _buildProductDetails(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(screenPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildText(
            title,
            AppTextStyles().bold16(),
            Get.theme.colorScheme.secondary,
          ),
          SizedBox(height: context.screenHeight * 0.005),
          _buildText(
            description,
            AppTextStyles().medium12(),
            Get.theme.colorScheme.onSurface,
          ),
          SizedBox(height: context.screenHeight * 0.005),
          _buildPriceRow(context),
          SizedBox(height: context.screenHeight * 0.005),
          CustomRating(
            isReadOnly: true,
            itemSize: 18,
          ),
          SizedBox(height: context.screenHeight * 0.005),
          _buildText(
            'Based on 800 reviews',
            AppTextStyles().medium8(),
            Get.theme.colorScheme.onSurface,
          ),
        ],
      ),
    );
  }

  Widget _buildPriceRow(BuildContext context) {
    return Row(
      children: [
        _buildText(
          originalPrice,
          AppTextStyles().semiBold18(),
          Get.theme.colorScheme.primary,
        ),
        SizedBox(width: context.screenWidth * 0.05),
        if (discountedPrice != null)
          _buildText(
            discountedPrice!,
            AppTextStyles().bold16(),
            Get.theme.colorScheme.onSurface,
            decoration: TextDecoration.lineThrough,
          ),
      ],
    );
  }

  Widget _buildText(
    String text,
    TextStyle style,
    Color color, {
    TextDecoration? decoration,
  }) {
    return Text(
      text,
      style: style.copyWith(
        color: color,
        decoration: decoration,
      ),
    );
  }

  Widget _buildFavoriteButton() {
    return Positioned(
      top: 10,
      left: 5,
      child: InkWell(
        onTap: () {
          log("Favorite tapped");
        },
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Get.theme.colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(32),
          ),
          child: Icon(
            Icons.favorite,
            color: Get.theme.colorScheme.onError,
          ),
        ),
      ),
    );
  }
}
