import 'dart:convert';
import 'package:quick_shop/core/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static late SharedPreferences prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  // Save Token
  static Future<void> saveToken({required String token}) async {
    await prefs.setString('token', "Bearer $token");
  }

  // get Token from SharedPreferences
  static Future<String?> getToken() async {
    String? token = prefs.getString('token');
    return token;
  }

  // Save User in SharedPreferences

  static Future<void> saveUser(User user) async {
    prefs.setString('user', jsonEncode(user.toJson()));
  }

  // get User from SharedPreferences

  static Future<User?> getUser() async {
    String? userString = prefs.getString('user');
    if (userString == null) {
      return null;
    }
    Map<String, dynamic> user = jsonDecode(userString);
    return User.fromJson(user);
  }

  // // get UserSetting from SharedPreferences
  // static Future<UserSetting?> getUserSettingFromPrefs() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? userSettingJson = prefs.getString('user_setting');
  //   if (userSettingJson != null) {
  //     if (userSettingJson.isNotEmpty) {
  //       Map<String, dynamic> userSettingMap = json.decode(userSettingJson);
  //       return UserSetting.fromJson(userSettingMap);
  //     }
  //   }

  //   return null;
  // }

  // // Save Setting in SharedPreferences
  // static Future<void> saveSetting(Setting setting) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString("setting", jsonEncode(setting.toJson()));
  // }

  // // Retrieve Setting from SharedPreferences
  // static Future<Setting?> getSettingFromPrefs() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? settingJson = prefs.getString("setting");

  //   if (settingJson != null && settingJson.isNotEmpty) {
  //     Map<String, dynamic> settingMap = json.decode(settingJson);
  //     return Setting.fromJson(settingMap);
  //   }

  //   return null;
  // }

  // // Save Bank List in SharedPreferences

  // static Future<void> saveBanks(List<Bank> banks) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   List<String> banksJsonList =
  //       banks.map((bank) => jsonEncode(bank.toJson())).toList();
  //   await prefs.setStringList("banks", banksJsonList);
  // }
  // // Retrieve Bank List from SharedPreferences

  // static Future<List<Bank>> getBanks() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   List<String>? banksJsonList = prefs.getStringList("banks");
  //   if (banksJsonList == null) {
  //     return [];
  //   }
  //   return banksJsonList
  //       .map((jsonString) => Bank.fromJson(jsonDecode(jsonString)))
  //       .toList();
  // }

  // // Save Currency List in SharedPreferences

  // static Future<void> saveCurrencies(List<LatestCurrency> currencies) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   List<String> currenciesJsonList =
  //       currencies.map((currency) => jsonEncode(currency.toJson())).toList();
  //   await prefs.setStringList("currencies", currenciesJsonList);
  // }
  // // Retrieve Currency List from SharedPreferences

  // static Future<List<LatestCurrency>> getCurrencies() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   List<String>? currenciesJsonList = prefs.getStringList("currencies");
  //   if (currenciesJsonList == null) {
  //     return [];
  //   }
  //   return currenciesJsonList
  //       .map((jsonString) => LatestCurrency.fromJson(jsonDecode(jsonString)))
  //       .toList();
  // }

  // // Save CurrencySorted List in SharedPreferences

  // static Future<void> saveCurrenciesSorted(
  //     List<LatestCurrency> currencies) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   List<String> currenciesJsonList =
  //       currencies.map((currency) => jsonEncode(currency.toJson())).toList();
  //   await prefs.setStringList("currencies_sorted", currenciesJsonList);
  // }

  // // Retrieve CurrencySorted List from SharedPreferences

  // static Future<List<LatestCurrency>> getCurrenciesSorted() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   List<String>? currenciesJsonList = prefs.getStringList("currencies_sorted");
  //   if (currenciesJsonList == null) {
  //     return [];
  //   }
  //   return currenciesJsonList
  //       .map((jsonString) => LatestCurrency.fromJson(jsonDecode(jsonString)))
  //       .toList();
  // }

  // // Save Bank Sorted List in SharedPreferences

  // static Future<void> saveSortedBanks(List<Bank> banks) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   List<String> banksJsonList =
  //       banks.map((bank) => jsonEncode(bank.toJson())).toList();
  //   await prefs.setStringList("sorted_banks", banksJsonList);
  // }
  // // Retrieve Bank List from SharedPreferences

  // static Future<List<Bank>> getSortedBanks() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   List<String>? banksJsonList = prefs.getStringList("sorted_banks");
  //   if (banksJsonList == null) {
  //     return [];
  //   }
  //   return banksJsonList
  //       .map((jsonString) => Bank.fromJson(jsonDecode(jsonString)))
  //       .toList();
  // }

  // // Save Favorite Bank
  // static Future<void> saveFavouriteBank(CurrencyInBank bank) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   List<CurrencyInBank> list = await getFavouriteBanks();
  //   list.add(bank);
  //   List<String> bankStrings =
  //       list.map((bank) => jsonEncode(bank.toJson())).toList();
  //   await prefs.setStringList('fav_bank', bankStrings);
  // }

  // // Retrieve Favorite Bank
  // static Future<List<CurrencyInBank>> getFavouriteBanks() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   List<String>? favBanks = prefs.getStringList("fav_bank");
  //   if (favBanks == null) {
  //     return [];
  //   }
  //   return favBanks
  //       .map((jsonString) => CurrencyInBank.fromJson(jsonDecode(jsonString)))
  //       .toList();
  // }

  // // un favourite bank Item
  // static Future<void> deleteFavouriteItem(CurrencyInBank bank) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   List<CurrencyInBank> list = await getFavouriteBanks();
  //   list.removeWhere((item) => item.bankId == bank.bankId);
  //   List<String> bankStrings =
  //       list.map((bank) => jsonEncode(bank.toJson())).toList();
  //   await prefs.setStringList('fav_bank', bankStrings);
  // }
}
