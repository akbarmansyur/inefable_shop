import 'package:get/get.dart';
import 'package:inefable_shop/data/api_repository.dart';
import 'package:inefable_shop/data/local_repository.dart';
import 'package:inefable_shop/repositories/api_repository.dart';
import 'package:inefable_shop/repositories/local_repositories.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiRepositoryInterface>(() => ApiRepositoryImpl(), fenix: true);
    // Get.lazyPut<LocalRepositoryInterface>(() => LocalRepositoryImpl());
    Get.lazyPut<LocalRepositoryInterface>(() {
      print('✅ LocalRepositoryInterface registered in HomeBinding');
      return LocalRepositoryImpl();
    }, fenix: true);
  }
}
