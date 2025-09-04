import 'package:flutter/material.dart' hide SearchController;
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:inefable_shop/controller/search_controller.dart';
import 'package:inefable_shop/models/product_model.dart';
import 'package:inefable_shop/route/app_pages.dart';

class SearchPage extends StatelessWidget {
  final SearchController controller = Get.find();

  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _buildSearchField(),
        automaticallyImplyLeading: false,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return Column(
          children: [
            // Suggestions
            if (controller.searchSuggestions.isNotEmpty &&
                controller.searchQuery.isNotEmpty)
              _buildSuggestionsList(),

            // Search Results or History
            Expanded(
              child: controller.showHistory.value
                  ? _buildSearchHistory()
                  : _buildSearchResults(),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: controller.searchController,
      focusNode: controller.searchFocusNode,
      autofocus: true,
      // onChanged: (value) => controller.setSearchQuery(value),
      decoration: InputDecoration(
        hintText: 'Cari produk, brand, atau kategori...',
        prefixIcon: const Icon(Iconsax.search_normal),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        suffixIcon: controller.searchQuery.isNotEmpty
            ? IconButton(
                icon: const Icon(Icons.clear),
                onPressed: controller.clearSearch,
              )
            : null,
        filled: true,
        fillColor: Colors.grey[100],
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
      ),
      onSubmitted: (value) {
        if (value.isNotEmpty) {
          controller.search(value);
        }
      },
    );
  }

  Widget _buildSuggestionsList() {
    return Container(
      color: Colors.grey[100],
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.searchSuggestions.length,
        itemBuilder: (context, index) {
          final suggestion = controller.searchSuggestions[index];
          return ListTile(
            leading: const Icon(Icons.search, size: 20),
            title: Text(suggestion),
            onTap: () => controller.selectSuggestion(suggestion),
          );
        },
      ),
    );
  }

  Widget _buildSearchHistory() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Riwayat Pencarian',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              if (controller.searchHistory.isNotEmpty)
                TextButton(
                  onPressed: () {
                    controller.clearSearchHistory();
                  },
                  child: const Text('Hapus Semua'),
                ),
            ],
          ),
        ),
        Expanded(
          child: controller.searchHistory.isEmpty
              ? const Center(child: Text('Belum ada riwayat pencarian'))
              : ListView.builder(
                  itemCount: controller.searchHistory.length,
                  itemBuilder: (context, index) {
                    final historyItem = controller.searchHistory[index];
                    return ListTile(
                      leading: const Icon(Icons.history),
                      title: Text(historyItem),
                      trailing: IconButton(
                        icon: const Icon(Icons.close, size: 18),
                        onPressed: () =>
                            controller.removeFromSearchHistory(historyItem),
                      ),
                      onTap: () => controller.search(historyItem),
                    );
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildSearchResults() {
    if (controller.searchQuery.isEmpty) {
      return const Center(child: Text('Mulai ketik untuk mencari produk...'));
    }

    if (controller.searchResults.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.search_off, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            Text(
              'Tidak ditemukan hasil untuk "${controller.searchQuery}"',
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: controller.searchResults.length,
      itemBuilder: (context, index) {
        final product = controller.searchResults[index];
        return _buildProductItem(product);
      },
    );
  }

  Widget _buildProductItem(Product product) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        contentPadding: const EdgeInsets.all(8),
        leading: product.images.isNotEmpty
            ? Image.network(
                product.images.first,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.image, size: 50),
              )
            : const Icon(Icons.image, size: 50),
        title: Text(product.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.description.length > 50
                  ? '${product.description.substring(0, 50)}...'
                  : product.description,
              style: const TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                if (product.isFlashSale && product.flashSalePrice != null)
                  Text(
                    'Rp ${product.flashSalePrice!.toString()}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                Text(
                  'Rp ${product.price.toString()}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: product.isFlashSale ? Colors.grey : Colors.green,
                    decoration: product.isFlashSale
                        ? TextDecoration.lineThrough
                        : null,
                  ),
                ),
                const SizedBox(width: 8),
                if (product.rating > 0)
                  Row(
                    children: [
                      const Icon(Icons.star, size: 14, color: Colors.amber),
                      Text('${product.rating}'),
                    ],
                  ),
              ],
            ),
          ],
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          // Navigate to product detail
          Get.toNamed(Routes.productdetail, arguments: product);
        },
      ),
    );
  }
}
