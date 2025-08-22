import 'package:get/get.dart';
import 'package:inefable_shop/controller/splash_controller.dart';
import 'package:inefable_shop/repositories/local_repositories.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
      () => SplashController(
        localRepository: Get.find<LocalRepositoryInterface>(),
      ),
    );
  }
}
