import 'package:dio/dio.dart';
import 'package:quick_shop/core/constants/app_constants.dart';
import 'package:quick_shop/core/models/offers.dart';
import 'package:quick_shop/core/services/error_handler.dart';

class HomeRepo {
  final Dio dio;
  HomeRepo({required this.dio});

  Future<Offers> getOffers() async {
    try {
      Response response = await dio.get(
        "$baseUrl/api/offers",
      );

      if (response.statusCode == 200 && response.data != null) {
        OffersResponse offersResponse = OffersResponse.fromJson(response.data);

        Offers offers = offersResponse.data;

        return offers;
      } else {
        throw ErrorHandler(message: "${response.statusMessage}");
      }
    } catch (e) {
      await ErrorHandler.handleGeneralException(e);
    }
    throw ErrorHandler(message: "Get offers failed");
  }
}
