import 'dart:developer';
import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio;
  final String baseUrl = 'https://khd.kankfyha.com';

  ApiClient({required this.dio});

  Future<ApiResult<T>> request<T>({
    required String endpoint,
    required T Function(dynamic) fromJson,
    String method = 'POST',
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      Response response;

      // تحديد نوع الطلب بناءً على المتغير `method`
      switch (method.toUpperCase()) {
        case 'GET':
          response = await dio.get(
            "$baseUrl$endpoint",
            queryParameters: queryParameters,
            options: options,
          );
          break;
        case 'POST':
          response = await dio.post(
            "$baseUrl$endpoint",
            data: data,
            queryParameters: queryParameters,
            options: options,
          );
          break;
        case 'PUT':
          response = await dio.put(
            "$baseUrl$endpoint",
            data: data,
            queryParameters: queryParameters,
            options: options,
          );
          break;
        case 'DELETE':
          response = await dio.delete(
            "$baseUrl$endpoint",
            data: data,
            queryParameters: queryParameters,
            options: options,
          );
          break;
        default:
          throw UnsupportedError('Unsupported HTTP method: $method');
      }

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Success<T>(fromJson(response.data));
      } else {
        log('Error: ${response.statusMessage}');
        return Error<T>('Unexpected response: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      log("DioException: ${e.message}");
      if (e.response != null) {
        return Error<T>(
            'Error: ${e.response!.statusCode} - ${e.response!.data}');
      } else {
        return Error<T>('Network error: ${e.message}');
      }
    } catch (e) {
      log("Unexpected error: $e");
      return Error<T>('Unexpected error: $e');
    }
  }
}

sealed class ApiResult<T> {
  const ApiResult();
}

class Success<T> extends ApiResult<T> {
  final T data;
  Success(this.data);
}

class Error<T> extends ApiResult<T> {
  final String message;
  Error(this.message);
}
