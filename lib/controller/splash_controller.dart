import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inefable_shop/models/product_model.dart';

import 'package:inefable_shop/repositories/local_repositories.dart';
import 'package:inefable_shop/route/app_pages.dart';

class SplashController extends GetxController {
  final LocalRepositoryInterface localRepository;
  SplashController({required this.localRepository});
  late List<Product> allProduct = [];
  @override
  void onInit() {
    super.onInit();
    initializeApp();
  }

  Future<void> initializeApp() async {
    try {
      // Load products dari local repository
      allProduct = await localRepository.getAllProduct();

      // Simpan products ke global controller jika diperlukan
      // Get.find<ProductController>().products.value = products;
    } catch (e) {
      print('Error loading products: $e');
    } finally {
      // Navigate setelah selesai
      Future.delayed(const Duration(milliseconds: 1000), () {
        Get.offAllNamed(Routes.intro);
      });
    }
  }
}
