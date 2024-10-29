import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/services/shared_preferences_singleton.dart';
import 'package:pushy_flutter/pushy_flutter.dart';
import 'package:quick_shop/main.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  RxDouble fadeAnimation = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    getData();
    _setupAnimationController();
    _setupPushyListeners();
  }

  void _setupAnimationController() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    final fadeTween = Tween<double>(begin: 0.5, end: 1.0);
    animationController.addListener(() {
      fadeAnimation.value = fadeTween
          .animate(CurvedAnimation(
            parent: animationController,
            curve: Curves.bounceIn,
          ))
          .value;
    });

    animationController.forward();
  }

  void _setupPushyListeners() {
    Pushy.listen();
    Pushy.toggleInAppBanner(true);
    Pushy.setNotificationListener(backgroundNotificationListener);
    Pushy.setNotificationClickListener((Map<String, dynamic> data) {
      log('Notification click: $data');
      _showNotificationDialog(data['message'] ?? 'Hello World!');
      Pushy.clearBadge();
    });
    pushyRegister();
  }

  void _showNotificationDialog(String message) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Notification click'),
          content: Text(message),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop('dialog');
              },
            ),
          ],
        );
      },
    );
  }

  void getData() async {
    try {
      //  final savedLocale = await Prefs.getLocale();
      final savedTheme = await Prefs.getTheme();

      // if (savedLocale != null) {
      //   Get.updateLocale(savedLocale);

      // }

      Get.changeTheme(savedTheme);

      Future.delayed(
        const Duration(seconds: 3),
        () {
          Get.offAllNamed("/on_boarding");
        },
      );
    } catch (e) {
      log("Error loading data: $e");
    }
  }

  Future<void> pushyRegister() async {
    try {
      String deviceToken = await Pushy.register();
      log('Device token: $deviceToken');
      await sendTokenToServer(deviceToken);
    } catch (error) {
      log("Error registering device for Pushy: $error");
    }
  }

  Future<void> sendTokenToServer(String token) async {}
}
