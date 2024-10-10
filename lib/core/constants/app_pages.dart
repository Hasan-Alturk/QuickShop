import 'package:get/get.dart';
import 'package:quick_shop/views/auth/sign_up_complete/sign_up_complete_with_email_view.dart';
import 'package:quick_shop/views/auth/sign_up_complete/sign_up_complete_with_phone_view.dart';
import 'package:quick_shop/views/auth/verification_code/verification_code_with_email_view.dart';
import 'package:quick_shop/views/cart/cart_binding.dart';
import 'package:quick_shop/views/cart/cart_view.dart';
import 'package:quick_shop/views/favourite/favourite_binding.dart';
import 'package:quick_shop/views/favourite/favourite_view.dart';
import 'package:quick_shop/views/main_home/main_home_binding.dart';
import 'package:quick_shop/views/main_home/main_home_view.dart';
import 'package:quick_shop/views/popular/popular_binding.dart';
import 'package:quick_shop/views/popular/popular_view.dart';
import 'package:quick_shop/views/auth/verification_code/verification_code_binding.dart';
import 'package:quick_shop/views/auth/verification_code/verification_code_with_phone_view.dart';
import 'package:quick_shop/views/auth/login/login_binding.dart';
import 'package:quick_shop/views/auth/login/login_view.dart';
import 'package:quick_shop/views/auth/sign_up_complete/sign_up_complete_binding.dart';
import 'package:quick_shop/views/auth/sign_up/sign_up_binding.dart';
import 'package:quick_shop/views/auth/sign_up/sign_up_view.dart';
import 'package:quick_shop/views/categories/categories_binding.dart';
import 'package:quick_shop/views/categories/categories_view.dart';
import 'package:quick_shop/views/flash_sale/flash_sale_binding.dart';
import 'package:quick_shop/views/flash_sale/flash_sale_view.dart';
import 'package:quick_shop/views/for_you/for_you_binding.dart';
import 'package:quick_shop/views/for_you/for_you_view.dart';
import 'package:quick_shop/views/home/home_binding.dart';
import 'package:quick_shop/views/home/home_view.dart';
import 'package:quick_shop/views/offers/offers_binding.dart';
import 'package:quick_shop/views/offers/offers_view.dart';
import 'package:quick_shop/views/onBoarding/on_boarding_binding.dart';
import 'package:quick_shop/views/onBoarding/on_boarding_view.dart';
import 'package:quick_shop/views/profile/profile_binding.dart';
import 'package:quick_shop/views/profile/profile_view.dart';
import 'package:quick_shop/views/splash/splash_binding.dart';
import 'package:quick_shop/views/splash/splash_view.dart';

List<GetPage> appPages = [
  GetPage(
    name: "/splash",
    page: () => const SplashView(),
    binding: SplashBinding(),
  ),
  GetPage(
    name: "/on_boarding",
    page: () => const OnBoardingView(),
    binding: OnBoardingBinding(),
  ),
  GetPage(
    name: "/login",
    page: () => const LoginView(),
    binding: LoginBinding(),
  ),

  GetPage(
    name: "/sign_up",
    page: () => const SignUpView(),
    binding: SignUpBinding(),
  ),
  GetPage(
    name: "/verification_code_with_email",
    page: () => const VerificationCodeWithEmailView(),
    binding: VerificationCodeBinding(),
  ),
  GetPage(
    name: "/verification_code_with_phone",
    page: () => const VerificationCodeWithPhoneView(),
    binding: VerificationCodeBinding(),
  ),

  GetPage(
    name: "/sign_up_complete_with_email",
    page: () => const SignUpCompleteWithEmailView(),
    binding: SignUpCompleteBinding(),
  ),
  GetPage(
    name: "/sign_up_complete_with_phone",
    page: () => const SignUpCompleteWithPhoneView(),
    binding: SignUpCompleteBinding(),
  ),

  // GetPage(
  //   name: "/forget_password",
  //   page: () => const ForgetPasswordView(),
  //   binding: ForgetPasswordBinding(),
  // ),

  GetPage(
    name: "/main_home",
    page: () => MainHomeView(),
    binding: MainHomeBinding(),
  ),

  GetPage(
    name: "/home",
    page: () => const HomeView(),
    binding: HomeBinding(),
  ),
  GetPage(
    name: "/Favorit",
    page: () => const FavouriteView(),
    binding: FavouriteBinding(),
  ),

  GetPage(
    name: "/Cart",
    page: () => const CartView(),
    binding: CartBinding(),
  ),
  GetPage(
    name: "/Profile",
    page: () => const ProfileView(),
    binding: ProfileBinding(),
  ),
  GetPage(
    name: "/offers",
    page: () => const OffersView(),
    binding: OffersBinding(),
  ),
  GetPage(
    name: "/categories",
    page: () => const CategoriesView(),
    binding: CategoriesBinding(),
  ),
  GetPage(
    name: "/flash_sale",
    page: () => const FlashSaleView(),
    binding: FlashSaleBinding(),
  ),
  GetPage(
    name: "/for_you",
    page: () => const ForYouView(),
    binding: ForYouBinding(),
  ),

  GetPage(
    name: "/popular",
    page: () => const PopularView(),
    binding: PopularBinding(),
  ),

  // GetPage(
  //   name: "/filter",
  //   page: () => const FilterView(),
  //   binding: FilterBinding(),
  // ),
];
