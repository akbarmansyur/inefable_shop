import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inefable_shop/controller/shop_controller.dart';
import 'package:inefable_shop/models/product_model.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:inefable_shop/route/app_pages.dart';
import 'package:inefable_shop/screens/main/components/simple_appbar.dart';
import 'package:inefable_shop/screens/main/components/simple_product_card.dart';

// Model Produk

class ShopPage extends StatelessWidget {
  ShopPage({super.key});

  final ShopController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Search Bar
          SimpleAppBar(),

          // Filter Chips
          SizedBox(
            height: 40,
            child: Obx(
              () => ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  FilterChip(
                    label: Text(
                      controller.selectedCategory.value,
                      style: const TextStyle(fontSize: 12),
                    ),
                    onSelected: (_) => _showCategoryDialog(context),
                  ),
                  const SizedBox(width: 8),
                  FilterChip(
                    label: Text(
                      'Price: \$${controller.minPrice.value.toInt()}-\$${controller.maxPrice.value.toInt()}',
                      style: const TextStyle(fontSize: 12),
                    ),
                    onSelected: (_) => _showPriceDialog(context),
                  ),
                  const SizedBox(width: 8),
                  FilterChip(
                    label: Text(
                      'Brand: ${controller.selectedBrand.value}',
                      style: const TextStyle(fontSize: 12),
                    ),
                    onSelected: (_) => _showBrandDialog(context),
                  ),
                  const SizedBox(width: 8),
                  FilterChip(
                    label: const Text('More Filters'),
                    onSelected: (_) => _showFilterDialog(context),
                  ),
                  const SizedBox(width: 8),
                  FilterChip(
                    label: Text('Sort: ${controller.sortBy.value}'),
                    onSelected: (_) => _showSortDialog(context),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Product Grid
          Expanded(
            child: Obx(
              () => MasonryGridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                mainAxisSpacing: 8, // jarak antar item vertikal
                crossAxisSpacing: 8,
                itemCount: controller.filteredProducts.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.toNamed(
                        Routes.productdetail,
                        arguments: controller.filteredProducts[index],
                      );
                    },
                    child: SimpleProductCard(
                      product: controller.filteredProducts[index],
                      isManshory: true,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showCategoryDialog(BuildContext context) {
    ShopController controller = Get.find();
    final List<String> categories = [
      'All',
      'Pakaian',
      'Topi',
      'aksesoris',
      'jaket',
      'Coats',
      'sepatu',
      'Accessories',
    ];

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Category'),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return ListTile(
                title: Text(category),
                trailing: controller.selectedCategory.value == category
                    ? const Icon(Icons.check, color: Colors.pink)
                    : null,
                onTap: () {
                  controller.selectedCategory.value = category;
                  controller.applyFilters();
                  Navigator.pop(context);
                },
              );
            },
          ),
        ),
      ),
    );
  }

  void _showPriceDialog(BuildContext context) {
    ShopController controller = Get.find();
    final int maxProductPrice = controller.allProducts.fold(
      0,
      (int max, Product p) => p.price > max ? p.price : max,
    );

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Price Range'),
        content: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Obx(
                () => RangeSlider(
                  values: RangeValues(
                    controller.minPrice.value,
                    controller.maxPrice.value.toDouble(),
                  ),
                  min: 0,
                  max: maxProductPrice.toDouble(),
                  divisions: 20,
                  labels: RangeLabels(
                    '${controller.minPrice.value.toInt()}',
                    '${controller.maxPrice.value.toInt()}',
                  ),
                  onChanged: (values) {
                    controller.minPrice.value = values.start;
                    controller.maxPrice.value = values.end.toInt();
                  },
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$${controller.minPrice.value.toInt()}'),
                  Text('\$${controller.maxPrice.value.toInt()}'),
                ],
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              controller.applyFilters();
              Navigator.pop(context);
            },
            child: const Text('Apply'),
          ),
        ],
      ),
    );
  }

  void _showBrandDialog(BuildContext context) {
    ShopController controller = Get.find();
    final brands = [
      'All',
      'Zara',
      'H&M',
      'Mango',
      'Massimo Dutti',
      'Levi\'s',
      'Steve Madden',
      'Nike',
      'Adidas',
    ];

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Brand'),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: brands.length,
            itemBuilder: (context, index) {
              final brand = brands[index];
              return ListTile(
                title: Text(brand),
                trailing: controller.selectedBrand.value == brand
                    ? const Icon(Icons.check, color: Colors.pink)
                    : null,
                onTap: () {
                  controller.selectedBrand.value = brand;
                  controller.applyFilters();
                  Navigator.pop(context);
                },
              );
            },
          ),
        ),
      ),
    );
  }

  void _showSortDialog(BuildContext context) {
    final sortOptions = [
      'Newest',
      'Price: Low to High',
      'Price: High to Low',
      'Rating',
      'A-Z',
      'Z-A',
    ];

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sort By'),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: sortOptions.length,
            itemBuilder: (context, index) {
              final option = sortOptions[index];
              return ListTile(
                title: Text(option),
                trailing: controller.sortBy.value == option
                    ? const Icon(Icons.check, color: Colors.pink)
                    : null,
                onTap: () {
                  controller.sortBy.value = option;
                  controller.applyFilters();
                  Navigator.pop(context);
                },
              );
            },
          ),
        ),
      ),
    );
  }

  void _showFilterDialog(BuildContext context) {
    final sizes = ['All', 'XS', 'S', 'M', 'L', 'XL'];
    final colors = [
      'All',
      'Black',
      'White',
      'Red',
      'Blue',
      'Green',
      'Yellow',
      'Pink',
    ];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        height: MediaQuery.of(context).size.height * 0.9,
        child: Column(
          children: [
            const Text(
              'Filters',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Size filter
                    const Text(
                      'Size',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: sizes.length,
                        itemBuilder: (context, index) {
                          final size = sizes[index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: FilterChip(
                              label: Text(size),
                              selected: controller.selectedSize.value == size,
                              onSelected: (selected) {
                                controller.selectedSize.value = selected
                                    ? size
                                    : 'All';
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Color filter
                    const Text(
                      'Color',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: colors.length,
                        itemBuilder: (context, index) {
                          final color = colors[index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: FilterChip(
                              label: Text(color),
                              selected: controller.selectedColor.value == color,
                              onSelected: (selected) {
                                controller.selectedColor.value = selected
                                    ? color
                                    : 'All';
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Rating filter
                    const Text(
                      'Minimum Rating',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Obx(
                      () => Slider(
                        value: controller.minRating.value,
                        min: 0,
                        max: 5,
                        divisions: 10,
                        label: controller.minRating.value.toStringAsFixed(1),
                        onChanged: (value) {
                          controller.minRating.value = value;
                        },
                      ),
                    ),
                    Text(
                      '${controller.minRating.value.toStringAsFixed(1)} stars and above',
                    ),
                    const SizedBox(height: 16),

                    // Additional filters
                    const Text(
                      'Other Filters',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Obx(
                      () => CheckboxListTile(
                        title: const Text('New Arrivals Only'),
                        value: controller.newArrivalsOnly.value,
                        onChanged: (value) {
                          controller.newArrivalsOnly.value = value ?? false;
                        },
                      ),
                    ),
                    Obx(
                      () => CheckboxListTile(
                        title: const Text('Sale Items Only'),
                        value: controller.onSaleOnly.value,
                        onChanged: (value) {
                          controller.onSaleOnly.value = value ?? false;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      controller.resetFilters();
                      Navigator.pop(context);
                    },
                    child: const Text('Reset All'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      controller.applyFilters();
                      Navigator.pop(context);
                    },
                    child: const Text('Apply Filters'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
