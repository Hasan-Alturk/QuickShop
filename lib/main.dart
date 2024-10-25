import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_pages.dart';
import 'package:quick_shop/core/services/shared_preferences_singleton.dart';
import 'package:pushy_flutter/pushy_flutter.dart';
import 'package:quick_shop/core/themes/my_themes.dart';
import 'package:quick_shop/views/splash/splash_binding.dart';

// مستمع الإشعارات في الخلفية
@pragma('vm:entry-point')
void backgroundNotificationListener(Map<String, dynamic> data) {
  String notificationTitle = 'Quick Shop';
  String notificationText = data['message'] ?? 'Hello World!';
  Pushy.notify(notificationTitle, notificationText, data);
  Pushy.clearBadge();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  runApp(const QuickShop());
}

class QuickShop extends StatelessWidget {
  const QuickShop({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyThemes.customLightTheme(),
      darkTheme: MyThemes.customDarkTheme(),
      locale: const Locale("en"),
      //    translations: MyTranslation(),
      initialBinding: SplashBinding(),
      initialRoute: "/splash",
      getPages: appPages,
    );
  }
}
