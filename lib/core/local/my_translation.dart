import 'package:get/get.dart';

class MyTranslation implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": {
          "language": "العربية",
          "products": "المنتجات",
        },
        "en": {
          "language": "Arabic",
          "products": "Products",
        },
        "fr": {
          "language": "arabe",
          "products": "Produits",
        },
        "tr": {
          "language": "Arapça",
          "products": "Ürünler",
        },
      };
}
