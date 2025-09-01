import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inefable_shop/controller/search_controller.dart';

class SearchBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchControllerApp>(() => SearchControllerApp());
  }
}
