import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_constants.dart';
import 'package:quick_shop/core/constants/app_text_styles.dart';

class CustomCardProduct extends StatelessWidget {
  const CustomCardProduct({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.originalPrice,
    this.discountedPrice,
    this.rating = 3.5,
  });

  final String image;
  final String title;
  final String description;
  final String originalPrice;
  final String? discountedPrice;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              SizedBox(
                height: context.screenHeight * 0.22,
                width: context.screenWidth,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: AppTextStyles().bold16().copyWith(
                              color: Get.theme.colorScheme.secondary,
                            ),
                      ),
                      SizedBox(height: context.screenHeight * 0.005),
                      Text(
                        description,
                        style: AppTextStyles().medium12().copyWith(
                              color: Get.theme.colorScheme.onSurface,
                            ),
                      ),
                      SizedBox(height: context.screenHeight * 0.005),
                      Row(
                        children: [
                          Text(
                            discountedPrice ?? '',
                            style: AppTextStyles().semiBold16().copyWith(
                                  color: Get.theme.colorScheme.primary,
                                ),
                          ),
                          SizedBox(width: context.screenWidth * 0.025),
                          Text(
                            originalPrice,
                            style: AppTextStyles().medium12().copyWith(
                                  color: Get.theme.colorScheme.onSecondary,
                                  decoration: TextDecoration.lineThrough,
                                ),
                          ),
                        ],
                      ),
                      SizedBox(height: context.screenHeight * 0.005),
                      RatingBar.builder(
                        itemSize: 18,
                        initialRating: rating,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        ignoreGestures: true,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star_outlined,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          log(rating.toString());
                        },
                      ),
                      SizedBox(height: context.screenHeight * 0.005),
                      Text(
                        'Based on 800 reviews',
                        style: AppTextStyles()
                            .medium8()
                            .copyWith(color: Get.theme.colorScheme.onSurface),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.topLeft,
            child: InkWell(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                width: 40,
                height: 40,
                decoration: ShapeDecoration(
                  color: Get.theme.colorScheme.onPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
                child: Icon(
                  Icons.favorite,
                  color: Get.theme.colorScheme.onError,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
