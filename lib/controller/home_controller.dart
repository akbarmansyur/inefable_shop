import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inefable_shop/data/fashion_data.dart';
import 'package:inefable_shop/models/category.dart';
import 'package:inefable_shop/models/product_model.dart';
import 'package:inefable_shop/repositories/local_repositories.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  final LocalRepositoryInterface localRepository;
  HomeController({required this.localRepository});

  late TabController tabController;
  late TabController bottomTabController;

  List<String> timelines = ['Weekly featured', 'Best of June', 'Best of 2018'];
  final RxList<Product> allProducts = <Product>[].obs;
  final RxList<Product> flashSaleProducts = <Product>[].obs;
  final RxList<Product> newItem = <Product>[].obs;
  final RxList<Category> categories = <Category>[].obs;
  final RxBool isLoading = false.obs;
  final RxString error = ''.obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 5, vsync: this);
    bottomTabController = TabController(length: 4, vsync: this);
    loadCategories();
    loadProducts();
  }

  @override
  void onClose() {
    // Jangan lupa dispose controller ketika tidak digunakan
    tabController.dispose();
    bottomTabController.dispose();
    super.onClose();
  }

  Future<void> loadProducts() async {
    try {
      isLoading(true);
      error('');

      final loadedProducts = await localRepository.getAllProduct();
      allProducts.assignAll(loadedProducts);
      flashSaleProducts.assignAll(
        loadedProducts
            .where((product) => product.isFlashSale == true)
            .take(10)
            .toList(),
      );
      newItem.assignAll(loadedProducts.take(10).toList().reversed);
    } catch (e) {
      error('Failed to load products: $e');
      print('❌ Error loading products: $e');
    } finally {
      isLoading(false);
    }
  }

  void loadCategories() {
    try {
      // Mengambil data dari static class FashionData
      final fashionCategories = FashionData.fashionCategories;

      // Assign ke observable list
      categories.assignAll(fashionCategories);
    } catch (e) {
      print('Failed to load categories: $e');
      Get.snackbar('Error', 'Failed to load categories');
    } finally {
      isLoading(false);
    }
  }
}
