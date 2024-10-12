import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quick_shop/core/constants/app_colors.dart';
import 'package:quick_shop/core/constants/app_images.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  CustomBottomNavigationBarState createState() =>
      CustomBottomNavigationBarState();
}

class CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  final List<double> _opacityValues = [
    1.0,
    1.0,
    1.0,
    1.0,
    1.0
  ]; // مصفوفة للقيم الشفافية

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: AppColors.darkColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        _buildNavItem(0, Assets.imagesHome),
        _buildNavItem(1, Assets.imagesCategories),
        _buildNavItem(2, Assets.imagesCart),
        _buildNavItem(3, Assets.imagesFavourite),
        _buildNavItem(4, Assets.imagesProfile),
      ]),
    );
  }

  Widget _buildNavItem(int index, String icon) {
    bool isActive = index == widget.currentIndex;

    return InkWell(
      onTap: () {
        setState(() {
          // تعيين قيمة الشفافية للأيقونة النشطة
          _opacityValues[index] = 0.1; // تعيين الشفافية إلى 0 لتصبح غير مرئية

          // تنفيذ animation
          Future.delayed(const Duration(milliseconds: 400), () {
            setState(() {
              _opacityValues[index] =
                  1.0; // تعيين الشفافية إلى 1 لجعلها مرئية مرة أخرى
            });
          });
        });
        widget.onTap(index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedOpacity(
            opacity: _opacityValues[index], // استخدام قيمة الشفافية
            duration: const Duration(milliseconds: 400), // مدة التدرج
            child: SvgPicture.asset(
              icon,
              // ignore: deprecated_member_use
              color: isActive ? AppColors.whiteColor : AppColors.grayColor,
            ),
          ),
        ],
      ),
    );
  }
}
