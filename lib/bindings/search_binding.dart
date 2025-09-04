import 'package:get/get.dart';
import 'package:inefable_shop/controller/search_controller.dart';
import 'package:inefable_shop/repositories/local_repositories.dart';

class SearchBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchController>(
      () => SearchController(
        localRepository: Get.find<LocalRepositoryInterface>(),
      ),
    );
  }
}
