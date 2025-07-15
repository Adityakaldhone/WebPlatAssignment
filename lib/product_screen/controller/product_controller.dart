import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/product.dart';

class ProductController extends GetxController {
  var products = <Product>[].obs;
  var filteredProducts = <Product>[].obs;
  var recentSearches = <String>[].obs;
  var isLoading = false.obs;
  var searchText = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
    loadRecentSearches();
  }

  Future<void> fetchProducts([String? title]) async {
    isLoading.value = true;
    try {
      String url = 'https://api.escuelajs.co/api/v1/products';
      if (title != null && title.isNotEmpty) {
        url += '?title=$title';
      }

      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        products.value = data.map((json) => Product.fromJson(json)).toList();
        filteredProducts.value = products;
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch products');
    } finally {
      isLoading.value = false;
    }
  }

  void searchProducts(String query) {
    searchText.value = query;
    if (query.isEmpty) {
      filteredProducts.value = products;
    } else {
      addToRecentSearches(query);
      fetchProducts(query);
    }
  }

  void addToRecentSearches(String search) {
    if (search.isNotEmpty && !recentSearches.contains(search)) {
      recentSearches.insert(0, search);
      if (recentSearches.length > 5) {
        recentSearches.removeLast();
      }
      saveRecentSearches();
    }
  }

  Future<void> saveRecentSearches() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('recent_searches', recentSearches);
  }

  Future<void> loadRecentSearches() async {
    final prefs = await SharedPreferences.getInstance();
    final searches = prefs.getStringList('recent_searches') ?? [];
    recentSearches.value = searches;
  }
}
