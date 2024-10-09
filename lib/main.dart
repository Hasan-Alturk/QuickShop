import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/local/my_translation.dart';
import 'package:quick_shop/core/constants/app_pages.dart';
import 'package:quick_shop/core/themes/my_themes.dart';
import 'package:pushy_flutter/pushy_flutter.dart';
import 'package:quick_shop/views/splash/splash_binding.dart';

// مستمع الإشعارات في الخلفية
@pragma('vm:entry-point')
void backgroundNotificationListener(Map<String, dynamic> data) {
  // عنوان الإشعار
  String notificationTitle = 'Quick Shop';

  // محاولة استخراج خاصية "message" من البيانات المستلمة: {"message":"Hello World!"}
  String notificationText = data['message'] ?? 'Hello World!';

  // نظام Android: يعرض إشعار نظام
  // نظام iOS: يعرض مربع تنبيه
  Pushy.notify(notificationTitle, notificationText, data);

  // مسح شارة التطبيق في نظام iOS
  Pushy.clearBadge();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const QuickShop());
}

class QuickShop extends StatelessWidget {
  const QuickShop({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyThemes.customLightTheme,
      translations: MyTranslation(),
      locale: const Locale("en"),
      // initialBinding: MainHomeBinding(),
      // initialRoute: "/main_home",

      initialBinding: SplashBinding(),
      initialRoute: "/splash",
      getPages: appPages,
    );
  }
}
