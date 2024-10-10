import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:quick_shop/core/services/_handler.dart';

class ErrorHandler implements Exception {
  final String message;

  ErrorHandler({required this.message});

  static Future<void> handleDioException(DioException e) async {
    if (e.response != null) {
      log('Error: ${e.response!.statusCode} - ${e.response!.data}');

      switch (e.response!.statusCode) {
        case 400:
          throw ErrorHandler(message: "Invalid request data");
        case 401:
          throw ErrorHandler(message: "Unauthorized access");
        case 403:
          throw ErrorHandler(message: "Forbidden access");
        case 404:
          throw ErrorHandler(message: "Resource not found");
        case 405:
          throw ErrorHandler(message: "Method not allowed");
        case 409:
          throw ErrorHandler(message: "Conflict: The user already exists");
        case 410:
          throw ErrorHandler(
              message: "Gone: The requested resource is no longer available");
        case 422:
          throw ErrorHandler(
              message: "Unprocessable entity: Validation failed");
        case 429:
          throw ErrorHandler(message: "Too many requests: Rate limit exceeded");
        case 500:
          throw ErrorHandler(message: "Internal server error");
        case 501:
          throw ErrorHandler(
              message:
                  "Not implemented: The server does not support the functionality required to fulfill the request");
        case 502:
          throw ErrorHandler(
              message:
                  "Bad gateway: The server received an invalid response from the upstream server");
        case 503:
          throw ErrorHandler(
              message:
                  "Service unavailable: The server is temporarily unable to handle the request");
        case 504:
          throw ErrorHandler(
              message:
                  "Gateway timeout: The server did not receive a timely response from the upstream server");
        default:
          throw ErrorHandler(
              message: "Unexpected error: ${e.response!.statusMessage}");
      }
    } else {
      log('Error: ${e.message}');
      throw ErrorHandler(message: "Network error: ${e.message}");
    }
  }

  // دالة عامة لمعالجة جميع الأخطاء الأخرى
  static Future<void> handleGeneralException(dynamic e) async {
    if (e is DioException) {
      await handleDioException(e);
    } else if (e is FormatException) {
      log('Error: Invalid format - $e');
      throw ExceptionHandler(message: "Invalid format: ${e.message}");
    } else if (e is TimeoutException) {
      log('Error: Timeout - $e');
      throw ExceptionHandler(
          message: "Request timed out, please try again later.");
    } else if (e is SocketException) {
      log('Error: Network issue - $e');
      throw ExceptionHandler(
          message: "No internet connection. Please check your network.");
    } else {
      log('Unknown Error: $e');
      throw ExceptionHandler(message: "An unexpected error occurred.");
    }
  }

  @override
  String toString() {
    return message;
  }
}
