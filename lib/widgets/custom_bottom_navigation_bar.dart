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
  final List<double> _rotationAngles = [0.0, 0.0, 0.0, 0.0, 0.0];
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
          // تغيير الزاوية فقط للأيقونة التي تم النقر عليها
          _rotationAngles[index] = 360; // تعيين الزاوية إلى 360

          // تعيين قيمة الشفافية للأيقونة النشطة
          _opacityValues[index] = 0.1; // تعيين الشفافية إلى 0 لتصبح غير مرئية

          // تنفيذ animation
          Future.delayed(const Duration(milliseconds: 500), () {
            setState(() {
              _rotationAngles[index] =
                  0; // إعادة الزاوية إلى 0 بعد انتهاء التحول
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
          AnimatedRotation(
            turns:
                _rotationAngles[index] / 360, // تحويل الزاوية إلى عدد الدورات
            duration: const Duration(milliseconds: 500), // مدة التحول
            child: AnimatedOpacity(
              opacity: _opacityValues[index], // استخدام قيمة الشفافية
              duration: const Duration(milliseconds: 500), // مدة التدرج
              child: SvgPicture.asset(
                icon,
                // ignore: deprecated_member_use
                color: isActive ? AppColors.whiteColor : AppColors.grayColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
