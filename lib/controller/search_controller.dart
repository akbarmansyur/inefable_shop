import 'package:get/get.dart';

// search_controller.dart
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:inefable_shop/models/product_model.dart';
import 'package:inefable_shop/repositories/local_repositories.dart';

class SearchController extends GetxController {
  final LocalRepositoryInterface localRepository;
  SearchController({required this.localRepository});
  final FocusNode searchFocusNode = FocusNode();
  final TextEditingController searchController = TextEditingController();

  final RxList<Product> allProducts = <Product>[].obs;
  final RxList<Product> searchResults = <Product>[].obs;
  final RxList<String> searchSuggestions = <String>[].obs;
  final RxList<String> searchHistory = <String>[].obs;

  final RxBool isLoading = false.obs;
  final RxString searchQuery = ''.obs;
  final RxBool showHistory = true.obs;
  final RxString error = ''.obs;

  final GetStorage _storage = GetStorage();
  final String _historyKey = 'searchHistory';

  @override
  void onInit() {
    super.onInit();
    searchController.addListener(_onSearchChanged);
    loadProducts();
    loadSearchHistory();
  }

  @override
  void onClose() {
    searchController.removeListener(_onSearchChanged);
    searchController.dispose();
    searchFocusNode.dispose();
    super.onClose();
  }

  void loadProducts() async {
    try {
      isLoading(true);
      error('');

      final loadedProducts = await localRepository.getAllProduct();
      allProducts.assignAll(loadedProducts);
    } catch (e) {
      error('Failed to load products: $e');
      print('❌ Error loading products: $e');
    } finally {
      isLoading(false);
    }
  }

  void loadSearchHistory() {
    final history = _storage.read<List<dynamic>>(_historyKey);
    if (history != null) {
      searchHistory.value = history.cast<String>().toList();
    }
  }

  void saveSearchHistory() {
    _storage.write(_historyKey, searchHistory.toList());
  }

  void addToSearchHistory(String query) {
    if (query.trim().isEmpty) return;

    // Remove if already exists to avoid duplicates
    searchHistory.remove(query);

    // Add to the beginning of the list
    searchHistory.insert(0, query);

    // Limit history to 10 items
    if (searchHistory.length > 10) {
      searchHistory.removeLast();
    }

    saveSearchHistory();
  }

  void clearSearchHistory() {
    searchHistory.clear();
    _storage.remove(_historyKey);
  }

  void removeFromSearchHistory(String query) {
    searchHistory.remove(query);
    saveSearchHistory();
  }

  void _onSearchChanged() {
    searchQuery.value = searchController.text;
    if (searchQuery.value.isEmpty) {
      searchResults.clear();
      searchSuggestions.clear();
      showHistory.value = true;
    } else {
      showHistory.value = false;
      _performSearch();
      _generateSuggestions();
    }
  }

  void _performSearch() {
    final query = searchQuery.value.toLowerCase();

    if (query.isEmpty) {
      searchResults.clear();
      return;
    }

    searchResults.value = allProducts.where((product) {
      return product.name.toLowerCase().contains(query) ||
          product.description.toLowerCase().contains(query) ||
          product.brand.toLowerCase().contains(query) ||
          product.categories.any(
            (category) => category.toLowerCase().contains(query),
          );
    }).toList();
  }

  void _generateSuggestions() {
    final query = searchQuery.value.toLowerCase();
    final suggestions = <String>{};

    for (var product in allProducts) {
      // Check name
      if (product.name.toLowerCase().contains(query)) {
        suggestions.add(product.name);
      }

      // Check description for words containing the query
      final words = product.description.toLowerCase().split(' ');
      for (var word in words) {
        if (word.contains(query) && word.length > 2) {
          suggestions.add(word);
        }
      }

      // Check brand
      if (product.brand.toLowerCase().contains(query)) {
        suggestions.add(product.brand);
      }

      // Check categories
      for (var category in product.categories) {
        if (category.toLowerCase().contains(query)) {
          suggestions.add(category);
        }
      }
    }

    searchSuggestions.value = suggestions.toList().sublist(
      0,
      suggestions.length > 5 ? 5 : suggestions.length,
    );
  }

  void clearSearch() {
    searchController.clear();
    searchResults.clear();
    searchSuggestions.clear();
    showHistory.value = true;
    searchFocusNode.unfocus();
  }

  void search(String query) {
    searchController.text = query;
    searchFocusNode.requestFocus();
    addToSearchHistory(query);
    _performSearch();
    showHistory.value = false;
  }

  void selectSuggestion(String suggestion) {
    search(suggestion);
  }
}
