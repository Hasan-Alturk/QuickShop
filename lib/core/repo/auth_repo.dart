import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quick_shop/core/constants/constants.dart';
import 'package:quick_shop/core/models/user.dart';
import 'package:quick_shop/core/services/error_handler.dart';

class AuthRepo {
  AuthRepo(this.dio);
  final Dio dio;

  // Google configuration
  final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  // Twilio configuration
  String accountSid = 'ACdc9cda35bb830403397d96a96dbfb937';
  String authToken = '6d560aa878729536ffe6131cfa805d3e';
  String serviceSid = 'VA087f4a42d118c412f2ccfbc106b0a131';

  // ** Login Methods **

  Future<User> loginWithFacebook() async {
    try {
      final LoginResult facebookSignIn = await FacebookAuth.instance.login();

      if (facebookSignIn.status == LoginStatus.success) {
        final Map<String, dynamic> facebookUser =
            await FacebookAuth.instance.getUserData();
        log(facebookUser.toString());

        Response response = await dio.post(
          "$baseUrl/api/users/login/facebook",
          data: {
            "id": facebookUser["id"].toString(),
            "name": facebookUser["name"].toString(),
          },
        );

        if (response.statusCode == 200 && response.data != null) {
          UserResopnse userResponse = UserResopnse.fromJson(response.data);
          User user = userResponse.data;
          return user;
        } else {
          throw ErrorHandler(message: "${response.statusMessage}");
        }
      } else {
        throw ErrorHandler(message: " ${facebookSignIn.message}");
      }
    } catch (e) {
      await ErrorHandler.handleGeneralException(e);
    }
    throw ErrorHandler(message: "Facebook login failed");
  }

  Future<User> loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        throw ErrorHandler(message: "Google sign-in was cancelled");
      }

      Response response = await dio.post(
        "$baseUrl/api/users/login/google",
        data: {
          "id": googleUser.id.toString(),
          "email": googleUser.email.toString(),
          "displayName": googleUser.displayName.toString(),
          "photoUrl": googleUser.photoUrl.toString()
        },
      );

      if (response.statusCode == 200 && response.data != null) {
        UserResopnse userResponse = UserResopnse.fromJson(response.data);
        User user = userResponse.data;
        return user;
      } else {
        throw ErrorHandler(message: "${response.statusMessage}");
      }
    } catch (e) {
      await ErrorHandler.handleGeneralException(e);
    }
    throw ErrorHandler(message: "Google login failed");
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

      if (response.statusCode == 200 && response.data != null) {
        UserResopnse userResponse = UserResopnse.fromJson(response.data);
        User user = userResponse.data;
        return user;
      } else {
        throw ErrorHandler(message: "${response.statusMessage}");
      }
    } catch (e) {
      await ErrorHandler.handleGeneralException(e);
    }
    throw ErrorHandler(message: "Login failed");
  }

  // ** Registration Methods **

  Future<Response<dynamic>> sendVerificationWithEmail({
    required String email,
  }) async {
    try {
      Response response = await dio.post(
        "$baseUrl/api/users/register/email",
        data: {
          "email": email,
        },
      );
      if (response.statusCode == 200 && response.data != null) {
        return response;
      } else {
        throw ErrorHandler(message: "${response.statusMessage}");
      }
    } catch (e) {
      await ErrorHandler.handleGeneralException(e);
    }
    throw ErrorHandler(message: "Failed to send verification email");
  }

  Future<Response<dynamic>> verifyOtpWithEmail({
    required String token,
    required String otp,
  }) async {
    try {
      dio.options.headers['Authorization'] = token;
      Response response = await dio.post(
        "$baseUrl/api/users/register/otp/verify",
        data: {
          "otp": otp,
        },
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );
      if (response.statusCode == 200 && response.data != null) {
        return response;
      } else {
        throw ErrorHandler(message: "${response.statusMessage}");
      }
    } catch (e) {
      await ErrorHandler.handleGeneralException(e);
    }
    throw ErrorHandler(message: "Failed to verify OTP with email");
  }

  Future<Response<dynamic>> reSendVerifyOtpWithEmail({
    required String token,
  }) async {
    try {
      dio.options.headers['Authorization'] = token;

      Response response = await dio.post(
        "$baseUrl/api/users/register/resend-otp",
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );
      if (response.statusCode == 200 && response.data != null) {
        return response;
      } else {
        throw ErrorHandler(message: "${response.statusMessage}");
      }
    } catch (e) {
      await ErrorHandler.handleGeneralException(e);
    }
    throw ErrorHandler(message: "Failed to resend verification email");
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

      if (response.statusCode == 200 && response.data != null) {
        UserResopnse userResponse = UserResopnse.fromJson(response.data);
        User user = userResponse.data;
        return user;
      } else {
        throw ErrorHandler(message: "${response.statusMessage}");
      }
    } catch (e) {
      await ErrorHandler.handleGeneralException(e);
    }
    throw ErrorHandler(message: "Sign up failed");
  }

  // ** Phone Verification Methods **

  Future<Response<dynamic>> sendVerificationWithPhone({
    required String phoneNumber,
  }) async {
    try {
      final responseTwilio = await dio.post(
        'https://verify.twilio.com/v2/Services/$serviceSid/Verifications',
        options: Options(
          headers: <String, String>{
            'Authorization':
                'Basic ${base64Encode(utf8.encode('$accountSid:$authToken'))}',
            'Content-Type': 'application/x-www-form-urlencoded',
          },
        ),
        data: {
          'To': phoneNumber,
          'Channel': "sms",
        },
      );

      if (responseTwilio.statusCode == 200 ||
          responseTwilio.statusCode == 201) {
        final response = await dio.post(
          '$baseUrl/api/users/register/phone',
          data: {
            "phone": phoneNumber,
          },
        );
        if (response.statusCode == 200 && response.data != null) {
          return response;
        } else {
          throw ErrorHandler(message: "${response.statusMessage}");
        }
      } else {
        throw ErrorHandler(message: "${responseTwilio.statusMessage}");
      }
    } catch (e) {
      await ErrorHandler.handleGeneralException(e);
    }
    throw ErrorHandler(message: "Failed to send verification SMS");
  }

  Future<Response<dynamic>> verifyOtpWithPhone({
    required String phoneNumber,
    required String otp,
  }) async {
    try {
      Response<dynamic> response = await dio.post(
        'https://verify.twilio.com/v2/Services/$serviceSid/VerificationCheck',
        data: {
          'To': phoneNumber,
          'Code': otp,
        },
        options: Options(
          headers: <String, String>{
            'Authorization':
                'Basic ${base64Encode(utf8.encode('$accountSid:$authToken'))}',
            'Content-Type': 'application/x-www-form-urlencoded',
          },
        ),
      );

      if (response.statusCode == 200 && response.data != null) {
        return response;
      } else {
        throw ErrorHandler(message: "${response.statusMessage}");
      }
    } catch (e) {
      await ErrorHandler.handleGeneralException(e);
    }
    throw ErrorHandler(message: "Failed to verify OTP with phone");
  }
}
