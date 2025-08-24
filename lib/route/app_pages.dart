import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:inefable_shop/bindings/home_binding.dart';
import 'package:inefable_shop/bindings/intro_binding.dart';
import 'package:inefable_shop/bindings/product_binding.dart';
import 'package:inefable_shop/bindings/splash_binding.dart';
import 'package:inefable_shop/screens/intro_page.dart';
import 'package:inefable_shop/screens/main/main_page.dart';
import 'package:inefable_shop/screens/product/product_page.dart';
import 'package:inefable_shop/screens/splash_page.dart';

part 'app_routes.dart';

/// contains all configuration pages
class AppPages {
  /// when the app is opened, this page will be the first to be shown
  static const initial = Routes.splash;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => MainPage(),
      binding: HomeBinding(),
      curve: Curves.fastOutSlowIn,
      transitionDuration: const Duration(milliseconds: 600),
      transition: Transition.fade,
    ),
    GetPage(
      name: _Paths.splash,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
      curve: Curves.fastOutSlowIn,
      transitionDuration: const Duration(milliseconds: 1000),
      transition: Transition.fade,
    ),
    GetPage(
      name: _Paths.intro,
      page: () => IntroPage(),
      binding: IntroBinding(),
      curve: Curves.fastOutSlowIn,
      transitionDuration: const Duration(milliseconds: 600),
      transition: Transition.fade,
    ),
    GetPage(
      name: _Paths.productdetail,
      page: () => ProductPage(),
      binding: ProductBinding(),
      curve: Curves.fastOutSlowIn,
      transitionDuration: const Duration(milliseconds: 600),
      transition: Transition.fade,
    ),
  ];
}
