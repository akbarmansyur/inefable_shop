import 'package:get/get.dart';
import 'package:inefable_shop/models/product_model.dart';
import 'package:inefable_shop/repositories/local_repositories.dart';

class ShopController extends GetxController {
  final LocalRepositoryInterface localRepository;
  ShopController({required this.localRepository});
  // Daftar semua produk
  final RxBool isLoading = false.obs;
  final RxString error = ''.obs;
  final List<Product> allProducts = <Product>[].obs;

  // Filter values
  final RxString selectedCategory = 'All'.obs;
  final RxDouble minPrice = 0.0.obs;
  final RxInt maxPrice = 500.obs;
  final RxString selectedBrand = 'All'.obs;
  final RxString selectedSize = 'All'.obs;
  final RxString selectedColor = 'All'.obs;
  final RxDouble minRating = 0.0.obs;
  final RxBool newArrivalsOnly = false.obs;
  final RxBool onSaleOnly = false.obs;

  // Sort values
  final RxString sortBy = 'Newest'.obs;

  // Observable variables
  var filteredProducts = <Product>[].obs;
  var searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize with all products
    loadProducts();
  }

  Future<void> loadProducts() async {
    try {
      isLoading(true);
      error('');

      final loadedProducts = await localRepository.getAllProduct();
      allProducts.assignAll(loadedProducts);
      filteredProducts.assignAll(loadedProducts);
      final int maxProductPrice = allProducts.fold(
        0,
        (max, p) => p.price > max ? p.price : max,
      );
      maxPrice.value = maxProductPrice;
    } catch (e) {
      error('Failed to load products: $e');
      print('❌ Error loading products: $e');
    } finally {
      isLoading(false);
    }
  }

  void applyFilters() {
    final filtered = allProducts.where((product) {
      // Category filter - case insensitive
      if (selectedCategory.value != 'All') {
        final selectedCategoryLower = selectedCategory.value.toLowerCase();
        final productCategoriesLower = product.categories
            .map((c) => c.toLowerCase())
            .toList();

        if (!productCategoriesLower.contains(selectedCategoryLower)) {
          return false;
        }
        print(product.categories.toString());
        print(product.id);
      }

      // Size filter - Mungkin perlu penyesuaian juga
      // if (selectedSize.value != 'All' &&
      //     !product.sizes.contains(selectedSize.value)) {
      //   // Asumsi: product.sizes adalah List
      //   return false;
      // }

      // Color filter - Mungkin perlu penyesuaian
      // if (selectedColor.value != 'All' &&
      //     product.color != selectedColor.value) {
      //   // Asumsi: product.color adalah String
      //   return false;
      // }

      // Price filter
      if (product.price < minPrice.value || product.price > maxPrice.value) {
        return false;
      }

      // Brand filter - case insensitive
      if (selectedBrand.value != 'All') {
        if (product.brand.toLowerCase() != selectedBrand.value.toLowerCase()) {
          return false;
        }
      }

      // New arrivals filter
      // if (newArrivalsOnly.value && !product.isNew) {
      //   // Asumsi: product.isNew adalah boolean
      //   return false;
      // }

      // Rating filter
      if (product.rating < minRating.value) {
        return false;
      }

      // Sale items filter
      if (onSaleOnly.value && !product.isFlashSale) {
        return false;
      }

      return true;
    }).toList();

    print("Filtered products count: ${filtered.length}");

    filteredProducts.assignAll(filtered);

    // Apply sorting
    sortProducts();
  }

  void sortProducts() {
    switch (sortBy.value) {
      case 'Price: Low to High':
        filteredProducts.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'Price: High to Low':
        filteredProducts.sort((a, b) => b.price.compareTo(a.price));
        break;
      case 'Rating':
        filteredProducts.sort((a, b) => b.rating.compareTo(a.rating));
        break;
      case 'A-Z':
        filteredProducts.sort((a, b) => a.name.compareTo(b.name));
        break;
      case 'Z-A':
        filteredProducts.sort((a, b) => b.name.compareTo(a.name));
        break;
      case 'Newest':
      default:
        // Default sort by newest (assuming newer products have higher ids)
        filteredProducts.sort((a, b) => b.id.compareTo(a.id));
        break;
    }
  }

  void resetFilters() {
    selectedCategory.value = 'All';
    minPrice.value = 0.0;

    // Reset max price to the highest product price
    final int maxProductPrice = allProducts.fold(
      0,
      (max, p) => p.price > max ? p.price : max,
    );
    maxPrice.value = maxProductPrice;

    selectedBrand.value = 'All';
    selectedSize.value = 'All';
    selectedColor.value = 'All';
    minRating.value = 0.0;
    newArrivalsOnly.value = false;
    onSaleOnly.value = false;
    sortBy.value = 'Newest';

    applyFilters();
  }
}

//   // Fungsi untuk filter produk
//   void filterProducts() {
//     var results = allProducts.where((product) {
//       // Filter berdasarkan pencarian
//       final matchesSearch =
//           searchQuery.isEmpty ||
//           product.name.toLowerCase().contains(searchQuery.toLowerCase());

//       // Filter berdasarkan kategori
//       final matchesCategory =
//           selectedCategory.value == 'All' ||
//           product.categories.first == selectedCategory.value;

//       // Filter berdasarkan harga
//       final matchesPrice =
//           product.price >= minPrice.value && product.price <= maxPrice.value;

//       return matchesSearch && matchesCategory && matchesPrice;
//     }).toList();

//     // Fungsi untuk sorting
//     switch (sortBy.value) {
//       case 'priceLowToHigh':
//         results.sort((a, b) => a.price.compareTo(b.price));
//         break;
//       case 'priceHighToLow':
//         results.sort((a, b) => b.price.compareTo(a.price));
//         break;
//       case 'rating':
//         results.sort((a, b) => b.rating.compareTo(a.rating));
//         break;
//       case 'name':
//       default:
//         results.sort((a, b) => a.name.compareTo(b.name));
//         break;
//     }

//     filteredProducts.assignAll(results);
//   }

//   // Fungsi untuk mengubah query pencarian
//   void setSearchQuery(String query) {
//     searchQuery.value = query;
//     filterProducts();
//   }

//   // Fungsi untuk mengubah kategori
//   void setCategory(String category) {
//     selectedCategory.value = category;
//     filterProducts();
//   }

//   // Fungsi untuk mengubah range harga
//   void setPriceRange(double min, double max) {
//     minPrice.value = min;
//     maxPrice.value = max;
//     filterProducts();
//   }

//   // Fungsi untuk mengubah sorting
//   void setSort(String sortOption) {
//     sortBy.value = sortOption;
//     filterProducts();
//   }

//   // Fungsi untuk reset semua filter
//   void resetFilters() {
//     searchQuery.value = '';
//     selectedCategory.value = 'All';
//     minPrice.value = 0.0;
//     maxPrice.value = 1000.0;
//     sortBy.value = 'name';
//     filterProducts();
//   }
// }


// Product(
    //   id: '1',
    //   name: 'Running Shoes',
    //   price: 89.99,
    //   imageUrl:
    //       'https://lh3.googleusercontent.com/aida-public/AB6AXuBkCl0qZJoRa0nyr93Cyt7cgKQDNwv3uo-WMj_wPyy3yd3V6Fn2VTaRsWVoiurBOezem3oWZwyB7NsIp7nmDVh0bKJUsrkhvqqKMnrWM_761mXWv2GvibQF22pyR2G2c-wqc8g5FMVppFCwyljHJ2OWeINuY07EPiLd9OZvsoS7NICpP0yF6BR8ZDaNkeVmwp0tubYademEFEQeq4BRAeiPRdaaytNvhp9E9gMMLfVEDilxsoV8uaWHOfvzkHwD2rv-CxVnubkwq8w',
    //   category: 'Shoes',
    //   rating: 4.5,
    // ),
    // Product(
    //   id: '2',
    //   name: 'Casual Sneakers',
    //   price: 59.99,
    //   imageUrl:
    //       'https://lh3.googleusercontent.com/aida-public/AB6AXuABbshGQKuFFywNhw8VFX-Wn-UaTBiEpikG4G4T3bV01BVcUIG5gpL6SZAiU785Ec_c7YWkBsoQsmFCPmB2rEHYd89HX0oZWLCRhPkGhnhvPXZtfaR5t97jcvarFbMN2hspdOh-luG_tXOBizj--gUbVC4AGt4D3RACDWeIP8yOxbAJJ3Irmzp5J49KQZWsbAnTvkzRmf2L_SlffM7uWpHMRVq25H6ZOSqEfe_LO_vNqAat-JZ3Ut8hwrJ2-SKlnWEvu6Vqol_JHi8',
    //   category: 'Shoes',
    //   rating: 4.2,
    // ),
    // Product(
    //   id: '3',
    //   name: 'Hiking Boots',
    //   price: 129.99,
    //   imageUrl:
    //       'https://lh3.googleusercontent.com/aida-public/AB6AXuCvkdXjWsDK3x1B0x-Se4Evgm8namJKzWAjM1xTNY0M9U9CA2SmpT7nmHPaoZOyZHTSSCs0vckzQugeLM_pgROPNooQDBGWO4EpK_7BMjMCmBjd5NmQhSkYjBbjQ02Q2gopVDFuMwLm4Rdh1RBbsLSYyzWqNAkh_PGU3l1AVL5fi8TZdEyk74ZOlvbTzLgdSgXvSrdC6cJU8SprpuY2DFu24WFkw8KC31rUtKlHLufgEDSiNtDmQq34Qt4XLmWo593ttfMyndn3YlU',
    //   category: 'Shoes',
    //   rating: 4.7,
    // ),
    // Product(
    //   id: '4',
    //   name: 'Formal Shoes',
    //   price: 79.99,
    //   imageUrl:
    //       'https://lh3.googleusercontent.com/aida-public/AB6AXuApwapNcEf0z8Bet0pHqEyPvmSzM4AJ50R2wy6x2TZVtzqie4DlwkmhofVJr5wqjqxArRB9YoPyoFA8v3aNyAziSh4j3S1EfgLL7IhIDJmR_TzxrbRQyNPkfc1zelVDtacoyambbZTQWJQKOJnMBkbITa-oKFY3ax3eKZ4klzUccggsTp1yMzAWNLJIXRyainJ8ydvsY8FUwcuVZCDUIjm-1qWZGeab5QltebZXxMCs16edvH5QJ9q_k0XkC3su9xhHsiDsnT2odLY',
    //   category: 'Shoes',
    //   rating: 4.3,
    // ),
    // Product(
    //   id: '5',
    //   name: 'Sandals',
    //   price: 39.99,
    //   imageUrl:
    //       'https://lh3.googleusercontent.com/aida-public/AB6AXuA2Lo_9JlEriJEHq3UFkOdytaMrTfWUIairHvzFCW15YPxf_UWJyMY1wLHSncxK7VTS7pUDQPKfvfpK7R7Xr-g2wO4Pkrfa1rcdftZCXxSNLYGF6XP96je1R4q4u0u5x5S52-QDFkZXfybjjtX34c5rVMX1quSCsN2SN1L8TxWqAH--IqKJZphu-BlhTQ116o4kpK7iOT7tfySPXQWArRQp_InRU4x5YtH2okieIGfveXleJ8ZrKZTBlGWCDLKj6fLcZQ7dZI8bpxw',
    //   category: 'Shoes',
    //   rating: 4.0,
    // ),
    // Product(
    //   id: '6',
    //   name: 'Slippers',
    //   price: 29.99,
    //   imageUrl:
    //       'https://lh3.googleusercontent.com/aida-public/AB6AXuBNPc0AHaV0k4pDvIPmHpO38GXN6jPc3TgmGAs9EL9TETePowZwvmDu4Wp_9-sU8EVqK2czPPKbmUYe7ruU8jpxULj4WwPKdq_r7C4NIfDmqHSmUfUnkTxn3KSI8pKLYAXVrLSiiXgs3nPp7Ys8VSM8dcPluFsGe6spCqWNsXScx_Iq600pGbCykaH7LqVB-R25YbptvRXn7YX_iom-zrjfkVJv1iy1PwZqCuWsvqgH-GgMIbwcg27tQT_V9iVJHIEGf86ZpdGIfMI',
    //   category: 'Shoes',
    //   rating: 3.8,
    // ),