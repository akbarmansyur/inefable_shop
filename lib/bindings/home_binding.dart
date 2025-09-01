import 'package:get/get.dart';
import 'package:inefable_shop/controller/home_controller.dart';
import 'package:inefable_shop/controller/shop_controller.dart';
import 'package:inefable_shop/repositories/local_repositories.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () =>
          HomeController(localRepository: Get.find<LocalRepositoryInterface>()),
    );
    Get.lazyPut<ShopController>(
      () =>
          ShopController(localRepository: Get.find<LocalRepositoryInterface>()),
    );
  }
}
