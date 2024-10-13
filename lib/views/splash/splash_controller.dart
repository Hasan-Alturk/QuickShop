import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/local/locale_controller.dart';
import 'package:quick_shop/core/themes/theme_controller.dart';
import 'package:pushy_flutter/pushy_flutter.dart';
import 'package:quick_shop/main.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final LocaleController localeController = LocaleController();
  final ThemeController themeController = ThemeController();

  late AnimationController animationController;

  RxDouble fadeAnimation = 0.0.obs;
  RxDouble scaleAnimation = 0.0.obs;

  @override
  void onInit() {
    getData();

    // بدء خدمة Pushy
    Pushy.listen();
    // استدعاء الميثود المسؤولة عن إعداد المستمعين
    // تفعيل إشعارات التطبيق الداخلية
    Pushy.toggleInAppBanner(true);

    // الاستماع للإشعارات المستلمة في الخلفية
    Pushy.setNotificationListener(backgroundNotificationListener);

    // الاستماع لنقر المستخدم على الإشعارات
    Pushy.setNotificationClickListener((Map<String, dynamic> data) {
      log('Notification click: $data');

      String message = data['message'] ?? 'Hello World!';

      showDialog(
        context: Get.context!,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Notification click'),
            content: Text(message),
            actions: [
              FloatingActionButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop('dialog');
                },
              ),
            ],
          );
        },
      );

      // مسح رقم الشارة في تطبيق iOS
      Pushy.clearBadge();
    });
    // تسجيل الجهاز للحصول على الإشعارات
    pushyRegister();

    super.onInit();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    animationController.addListener(() {
      fadeAnimation.value = Tween<double>(begin: 0.5, end: 1.0)
          .animate(CurvedAnimation(
              parent: animationController, curve: Curves.bounceIn))
          .value;

      scaleAnimation.value = Tween<double>(begin: 0.5, end: 1.0)
          .animate(CurvedAnimation(
              parent: animationController, curve: Curves.elasticOut))
          .value;
    });

    animationController.forward();
  }

  // void setupPushyListeners() {
  //   // تفعيل إشعارات التطبيق الداخلية
  //   Pushy.toggleInAppBanner(true);

  //   // الاستماع للإشعارات المستلمة في الخلفية
  //   Pushy.setNotificationListener(backgroundNotificationListener);

  //   // الاستماع لنقر المستخدم على الإشعارات
  //   Pushy.setNotificationClickListener((Map<String, dynamic> data) {
  //     log('Notification click: $data');

  //     String message = data['message'] ?? 'Hello World!';

  //     showDialog(
  //       context: Get.context!,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: const Text('Notification click'),
  //           content: Text(message),
  //           actions: [
  //             FloatingActionButton(
  //               child: const Text('OK'),
  //               onPressed: () {
  //                 Navigator.of(context, rootNavigator: true).pop('dialog');
  //               },
  //             ),
  //           ],
  //         );
  //       },
  //     );

  //     // مسح رقم الشارة في تطبيق iOS
  //     Pushy.clearBadge();
  //   });
  // }

  void getData() async {
    try {
      final savedLocale = await localeController.getLocale();

      final savedTheme = await themeController.getTheme();

      if (savedLocale != null) {
        //Get.updateLocale(savedLocale);
        log("savedLocale != null");
      }
      Get.changeTheme(savedTheme);
      log("savedTheme != null");
      Future.delayed(const Duration(seconds: 3), () {
        log("on_boarding");

        Get.offAllNamed("/on_boarding");
      });
    } catch (e) {
      log("Error loading data: $e");
    }
  }

  Future<void> pushyRegister() async {
    try {
      // تسجيل المستخدم لإشعارات الدفع
      String deviceToken = await Pushy.register();

      // طباعة الرمز في وحدة التحكم
      log('Device token: $deviceToken');

      // إرسال الرمز إلى خادم الواجهة الخلفية
      await sendTokenToServer(deviceToken);
      log("رمز جهاز Pushy: $deviceToken");
    } catch (error) {
      log(error.toString());
    }
  }

  Future<void> sendTokenToServer(String token) async {}
}
