import 'dart:convert';
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
        final Map<String, dynamic> facebookUser =
            await FacebookAuth.instance.getUserData();

        Response response = await dio.post(
          "$baseUrl/api/users/login/facebook",
          data: {
            "id": facebookUser["id"].toString(),
            "name": facebookUser["name"].toString(),
          },
        );

        if (response.statusCode == 200 && response.data != null) {
          if (response.data != null) {
            UserResopnse userResponse = UserResopnse.fromJson(response.data);
            User user = userResponse.data;
            return user;
          }
        } else {
          throw ErrorHandler(message: "${response.statusMessage}");
        }
      } else if (facebookSignIn.status == LoginStatus.failed) {
        throw ErrorHandler(message: " ${facebookSignIn.message}");
      }
    } catch (e) {
      await ErrorHandler.handleGeneralException(e);
    }
    throw ErrorHandler(message: "Sign in with facebook failed");
  }

  Future<User> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      // if (googleUser == null) {
      //   throw ErrorHandler(message: "sign in google was cancelled");
      // }

      Response response = await dio.post(
        "$baseUrl/api/users/login/google",
        data: {
          "id": googleUser!.id.toString(),
          "email": googleUser.email.toString(),
          "displayName": googleUser.displayName ?? "",
          //  "photoUrl": googleUser.photoUrl ?? ""
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
    throw ErrorHandler(message: "sign in with google failed");
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
    throw ErrorHandler(message: "Failed to resend OTP");
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

  Future<Response<dynamic>> sendVerificationWithPhone({
    required String phoneNumber,
  }) async {
    try {
      final response = await dio.post(
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
      if (response.statusCode == 200 && response.data != null) {
        return response;
      } else {
        throw ErrorHandler(message: "${response.statusMessage}");
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
