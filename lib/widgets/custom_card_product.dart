import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_text_styles.dart';

class CustomCardProduct extends StatelessWidget {
  const CustomCardProduct({
    super.key,
    required this.image,
    required this.productName,
    required this.description,
    required this.originalPrice,
    this.discountedPrice,
  });

  final String image;
  final String productName;
  final String description;
  final String originalPrice;
  final String? discountedPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360,
      width: 170,
      decoration: ShapeDecoration(
        color: Get.theme.colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 200,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: Image.asset(
                    image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productName,
                        style: AppTextStyles().bold16().copyWith(
                              color: Get.theme.colorScheme.secondary,
                            ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        description,
                        style: AppTextStyles().medium12().copyWith(
                              color: Get.theme.colorScheme.onSurface,
                            ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Text(
                            originalPrice,
                            style: AppTextStyles().medium12().copyWith(
                                  color: Get.theme.colorScheme.onSecondary,
                                  decoration: TextDecoration.lineThrough,
                                ),
                          ),
                          const SizedBox(width: 15),
                          Text(
                            discountedPrice!,
                            style: AppTextStyles().semiBold16().copyWith(
                                  color: Get.theme.colorScheme.primary,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      RatingBar.builder(
                        itemSize: 16,
                        initialRating: 3.5,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          log(rating.toString());
                        },
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Based on 800 review',
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
            child: Container(
              margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
              width: 40,
              height: 40,
              decoration: ShapeDecoration(
                color: Get.theme.colorScheme.onPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              child: Icon(
                Icons.favorite,
                color: Get.theme.colorScheme.onError,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
