import 'package:inefable_shop/models/product_model.dart';

abstract class LocalRepositoryInterface {
  Future<List<Product>> getAllProduct();
}
