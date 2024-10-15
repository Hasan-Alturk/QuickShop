import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_images.dart';

class CustomGoogleFacebookIphone extends StatelessWidget {
  const CustomGoogleFacebookIphone({
    super.key,
    required this.onTapGoogle,
    required this.onTapFacebook,
  });
  final void Function() onTapGoogle;
  final void Function() onTapFacebook;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: onTapGoogle,
            child: Container(
              height: 50,
              decoration: ShapeDecoration(
                color: Get.theme.colorScheme.surface,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 2,
                    color: Get.theme.colorScheme.onSecondary,
                  ),
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
              child: SvgPicture.asset(
                Assets.imagesGoogle,
                fit: BoxFit.none,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: InkWell(
            onTap: onTapFacebook,
            child: Container(
              height: 50,
              decoration: ShapeDecoration(
                color: Get.theme.colorScheme.surface,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 2,
                    color: Get.theme.colorScheme.onSecondary,
                  ),
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
              child: SvgPicture.asset(
                Assets.imagesFacebook,
                fit: BoxFit.none,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Container(
            height: 50,
            decoration: ShapeDecoration(
              color: Get.theme.colorScheme.surface,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 2,
                  color: Get.theme.colorScheme.onSecondary,
                ),
                borderRadius: BorderRadius.circular(32),
              ),
            ),
            child: SvgPicture.asset(
              Assets.imagesApple,
              fit: BoxFit.none,
            ),
          ),
        ),
      ],
    );
  }
}
