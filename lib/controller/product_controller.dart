import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:inefable_shop/models/product_model.dart';
import 'package:intl/intl.dart';

class ProductController extends GetxController {
  final product = Rx<Product?>(null);
  final isLoading = true.obs;
  final PageController pageSliderController = PageController();

  @override
  void onInit() {
    loadProduct();
    super.onInit();
  }

  Future<void> loadProduct() async {
    try {
      isLoading(true);

      // Prioritaskan arguments jika ada (lebih cepat)
      if (Get.arguments != null && Get.arguments is Product) {
        product.value = Get.arguments as Product;
        isLoading(false);
        return;
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load product: $e');
    } finally {
      isLoading(false);
    }
  }

  String formatRupiah(int price) {
    final format = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    return format.format(price);
  }
}
