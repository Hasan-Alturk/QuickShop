import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quick_shop/core/models/user.dart';
import 'package:quick_shop/core/services/error_handler.dart';

String baseUrl = "https://khd.kankfyha.com";

class AuthRepo {
  AuthRepo(this.dio);

  final Dio dio;

  final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  String accountSid = 'ACdc9cda35bb830403397d96a96dbfb937';
  String authToken = '6d560aa878729536ffe6131cfa805d3e';
  String serviceSid = 'VA087f4a42d118c412f2ccfbc106b0a131';

  Future<User> signInWithFacebook() async {
    try {
      final LoginResult facebookSignIn = await FacebookAuth.instance.login();

      if (facebookSignIn.status == LoginStatus.success) {
        final facebookUser = await FacebookAuth.instance.getUserData();

        final String userId = facebookUser["id"].toString();
        final String userName = facebookUser["name"].toString();

        if (userId.isEmpty || userName.isEmpty) {
          throw ExceptionHandler(message: "Facebook data is incomplete");
        }

        Response response = await dio.post(
          "$baseUrl/api/users/login/facebook",
          data: {
            "id": userId,
            "name": userName,
          },
        );

        if (response.statusCode == 200) {
          if (response.data != null) {
            UserResopnse userResponse = UserResopnse.fromJson(response.data);
            User user = userResponse.data;
            return user;
          } else {
            throw ExceptionHandler(message: "Response data is null");
          }
        } else {
          log('Error:  ${response.statusMessage}');
          throw ExceptionHandler(
              message: "Unexpected response: ${response.statusMessage}");
        }
      } else {
        throw ExceptionHandler(message: "Login failed");
      }
    } on DioException catch (e) {
      if (e.response != null) {
        log('Error: ${e.response!.statusCode} - ${e.response!.data}');
        if (e.response!.statusCode == 400) {
          throw ExceptionHandler(message: "Invalid request data");
        } else if (e.response!.statusCode == 409) {
          throw ExceptionHandler(message: "The user already exists");
        } else {
          throw ExceptionHandler(
              message: "Unexpected error: ${e.response!.statusMessage}");
        }
      } else {
        log('Error: ${e.message}');
        throw ExceptionHandler(message: "Network error: ${e.message}");
      }
    } catch (e) {
      log('Unexpected Error: $e');
      throw ExceptionHandler(message: "An unexpected error occurred");
    }
  }

  Future<User> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      Response response = await dio.post(
        "$baseUrl/api/users/login/google",
        data: {
          "id": googleUser!.id.toString(),
          "email": googleUser.email.toString(),
          "displayName": googleUser.displayName.toString(),
          "photoUrl": googleUser.photoUrl.toString()
        },
      );
      if (response.statusCode == 200) {
        UserResopnse userResponse = UserResopnse.fromJson(response.data);
        User user = userResponse.data;
        return user;
      } else {
        log('Error:  ${response.statusMessage}');
        throw ExceptionHandler(
            message: "Unexpected response: ${response.statusMessage}");
      }
    } on DioException catch (e) {
      if (e.response != null) {
        log('Error: ${e.response!.statusCode} - ${e.response!.data}');
        if (e.response!.statusCode == 400) {
          throw ExceptionHandler(message: "Invalid request data");
        } else if (e.response!.statusCode == 409) {
          throw ExceptionHandler(message: "The user already exists");
        } else {
          throw ExceptionHandler(
              message: "Unexpected error: ${e.response!.statusMessage}");
        }
      } else {
        log('Error: ${e.message}');
        throw ExceptionHandler(message: "Network error: ${e.message}");
      }
    } catch (e) {
      log('Unexpected Error: $e');
      throw ExceptionHandler(message: "An unexpected error occurred");
    }
  }

  Future<void> signOutFromGoogle() async {
    try {
      await googleSignIn.signOut();
    } catch (error) {
      log(error.toString());
    }
  }

  Future<User> login({
    required String login,
    required String password,
  }) async {
    try {
      Response response = await dio.post(
        "$baseUrl/api/users/login",
        data: {
          "login": login,
          "password": password,
        },
      );

      if (response.statusCode == 200) {
        UserResopnse userResponse = UserResopnse.fromJson(response.data);
        User user = userResponse.data;
        return user;
      } else {
        log('Error:  ${response.statusMessage}');
        throw ExceptionHandler(
            message: "Unexpected response: ${response.statusMessage}");
      }
    } on DioException catch (e) {
      if (e.response != null) {
        log('Error: ${e.response!.statusCode} - ${e.response!.data}');
        if (e.response!.statusCode == 400) {
          throw ExceptionHandler(message: "Invalid request data");
        } else if (e.response!.statusCode == 409) {
          throw ExceptionHandler(message: "The user already exists");
        } else {
          throw ExceptionHandler(
              message: "Unexpected error: ${e.response!.statusMessage}");
        }
      } else {
        log('Error: ${e.message}');
        throw ExceptionHandler(message: "Network error: ${e.message}");
      }
    } catch (e) {
      log('Unexpected Error: $e');
      throw ExceptionHandler(message: "An unexpected error occurred");
    }
  }

  Future<Response<dynamic>> sendVerificationWithEmail(
      {required String email}) async {
    try {
      Response response = await dio.post(
        "$baseUrl/api/users/register/email",
        data: {
          "email": email,
        },
      );
      log(response.data.toString());
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        switch (e.response!.statusCode) {
          case 404:
            log("Try again");
            throw ExceptionHandler(message: "Try again");
          case 409:
            log("Wrong");

            throw ExceptionHandler(message: "Wrong");
          case 500:
            log("Server error, please try later");

            throw ExceptionHandler(message: "Server error, please try later.");
          default:
            log("Unexpected error");

            throw ExceptionHandler(
                message: "Unexpected error: ${e.response!.statusCode}");
        }
      }
      log("Network error, please check your connection");
      throw ExceptionHandler(
          message: "Network error, please check your connection.");
    } catch (e) {
      log("An unexpected error occurred");
      throw ExceptionHandler(message: "An unexpected error occurred.");
    }
  }

  Future<Response<dynamic>> verifyOtpWithEmail(
      {required String token, required String otp}) async {
    try {
      dio.options.headers['Authorization'] = token;

      Response response = await dio.post(
        "$baseUrl/api/users/register/otp/verify",
        data: {
          "otp": otp,
        },
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );

      log(response.data.toString());
      return response;
    } on DioException catch (e) {
      // معالجة الأخطاء
      if (e.response != null) {
        // استجابة من الخادم
        log("Error response: ${e.response?.data}");
        log("Error status code: ${e.response?.statusCode}");
        throw ExceptionHandler(
            message: "Error: ${e.response?.statusCode} - ${e.response?.data}");
      } else {
        // خطأ في الاتصال بالخادم
        log("Error message: ${e.message}");
        throw ExceptionHandler(message: "Error: ${e.message}");
      }
    } catch (e) {
      // أي نوع من الأخطاء الأخرى
      log("Unknown error: $e");
      throw ExceptionHandler(message: "Unknown error: $e");
    }
  }

  Future<Response<dynamic>> reSendVerifyOtpWithEmail(
      {required String token}) async {
    try {
      dio.options.headers['Authorization'] = token;

      Response response = await dio.post(
        "$baseUrl/api/users/register/resend-otp",
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );

      log(response.data.toString());
      return response;
    } on DioException catch (e) {
      // معالجة الأخطاء
      if (e.response != null) {
        // استجابة من الخادم
        log("Error response: ${e.response?.data}");
        log("Error status code: ${e.response?.statusCode}");
        throw ExceptionHandler(
            message: "Error: ${e.response?.statusCode} - ${e.response?.data}");
      } else {
        // خطأ في الاتصال بالخادم
        log("Error message: ${e.message}");
        throw ExceptionHandler(message: "Error: ${e.message}");
      }
    } catch (e) {
      // أي نوع من الأخطاء الأخرى
      log("Unknown error: $e");
      throw ExceptionHandler(message: "Unknown error: $e");
    }
  }

  Future<User> signUp({
    required String token,
    required String name,
    required String password,
    required String passwordConfirmation,
  }) async {
    dio.options.headers['Authorization'] = token;

    try {
      Response response = await dio.post(
        "$baseUrl/api/users/register/password",
        data: {
          "name": name,
          "password": password,
          "password_confirmation": passwordConfirmation,
        },
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );

      if (response.statusCode == 200) {
        UserResopnse userResponse = UserResopnse.fromJson(response.data);
        User user = userResponse.data;
        return user;
      } else {
        log('Error: ${response.statusCode} - ${response.statusMessage}');
        throw Exception("Unexpected response: ${response.statusMessage}");
      }
    } on DioException catch (e) {
      if (e.response != null) {
        log('Error: ${e.response!.statusCode} - ${e.response!.data}');
        if (e.response!.statusCode == 400) {
          throw ExceptionHandler(message: "Invalid request data");
        } else if (e.response!.statusCode == 409) {
          throw ExceptionHandler(message: "The user already exists");
        } else {
          throw Exception("Unexpected error: ${e.response!.statusMessage}");
        }
      } else {
        log('Error: ${e.message}');
        throw Exception("Network error: ${e.message}");
      }
    } catch (e) {
      log('Unexpected Error: $e');
      throw Exception("An unexpected error occurred");
    }
  }

  Future<Response<dynamic>> sendVerificationWithPhone(
      {required String phoneNumber}) async {
    final String basicAuth =
        'Basic ${base64Encode(utf8.encode('$accountSid:$authToken'))}';

    try {
      final response = await dio.post(
        'https://verify.twilio.com/v2/Services/$serviceSid/Verifications',
        options: Options(
          headers: <String, String>{
            'Authorization': basicAuth,
            'Content-Type': 'application/x-www-form-urlencoded',
          },
        ),
        data: {
          'To': phoneNumber,
          'Channel': "sms",
        },
      );
      return response;
    } on DioException catch (e) {
      // معالجة الأخطاء
      if (e.response != null) {
        // استجابة من الخادم
        log("Error response: ${e.response?.data}");
        log("Error status code: ${e.response?.statusCode}");
        throw ExceptionHandler(
            message: "Error: ${e.response?.statusCode} - ${e.response?.data}");
      } else {
        // خطأ في الاتصال بالخادم
        log("Error message: ${e.message}");
        throw ExceptionHandler(message: "Error: ${e.message}");
      }
    } catch (e) {
      // أي نوع من الأخطاء الأخرى
      log("Unknown error: $e");
      throw ExceptionHandler(message: "Unknown error: $e");
    }
  }

  Future<Response<dynamic>> verifyOtpWithPhone(
      {required String phoneNumber, required String otp}) async {
    final String basicAuth =
        'Basic ${base64Encode(utf8.encode('$accountSid:$authToken'))}';

    dio.options.headers['Content-Type'] = 'application/x-www-form-urlencoded';
    dio.options.headers['Authorization'] = basicAuth;

    String url =
        'https://verify.twilio.com/v2/Services/$serviceSid/VerificationCheck';

    try {
      Response<dynamic> response = await dio.post(
        url,
        data: {
          'To': phoneNumber,
          'Code': otp,
        },
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );
      log(response.statusCode.toString());

      if (response.statusCode == 200) {
        log("OTP verified successfully: ${response.data}");
      } else {
        log("Failed to verify OTP: ${response.data}");
      }
      return response;
    } catch (e) {
      log("Error occurred: $e");
    }

    throw ExceptionHandler(message: "Unknown error");
  }
}

 





// Future<MainUser> passwordSuccessfully({
//   required String password,
//   required String passwordConfirmation,
//   required String otp,
//   required String email,
// }) async {
//   try {
//     var response = await dio.post(
//       "$baseUrl/update_forgotten_password",
//       data: {
//         "password": password,
//         "password_confirmation": passwordConfirmation,
//         "otp": otp,
//         "email": email,
//       },
//     );
//     MainUser mainUser = MainUser.fromJson(response.data);
//     log(mainUser.accessToken.toString());
//     return mainUser;
//   } on DioException catch (e) {
//     log(e.response!.statusCode.toString());
//     if (e.response != null) {
//       if (e.response!.statusCode == 404) {
//         throw ExceptionHandler("");
//       }
//     }
//     throw ExceptionHandler("Unknown error");
//   }
// }
