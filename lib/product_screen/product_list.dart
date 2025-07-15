import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:webplat_assignment/product_screen/controller/product_controller.dart';
import 'package:webplat_assignment/product_screen/widgets/product_card.dart';
import 'package:webplat_assignment/product_screen/widgets/shimmerCard.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  ProductController controller = Get.find<ProductController>();
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text("Products")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Search Products ...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                filled: true,
                fillColor: Colors.grey.shade50,
              ),
              onChanged: (v) {
                if (v.isEmpty) {
                  controller.searchProducts('');
                }
              },
              onSubmitted: (v) {
                controller.searchProducts(v);
              },
            ),
          ),

          Obx(() {
            if (controller.recentSearches.isEmpty) {
              return const SizedBox();
            }
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 50,
              child: ListView.builder(
                itemCount: controller.recentSearches.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final search = controller.recentSearches[index];
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 200 + (index * 50)),
                    curve: Curves.easeOut,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: FilterChip(
                        label: Text(search),
                        onSelected: (val) {
                          searchController.text = search;
                          log("search = $search");
                          controller.searchProducts(search);
                        },
                      ),
                    ),
                  );
                },
              ),
            );
          }),

          const SizedBox(height: 10),

          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return AnimatedOpacity(
                      duration: Duration(milliseconds: 200 + (index * 100)),
                      opacity: 1.0,
                      child: const ShimmerCard(),
                    );
                  },
                );
              }

              if (controller.filteredProducts.isEmpty) {
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.search_off, size: 64, color: Colors.grey),
                      SizedBox(height: 16),
                      Text(
                        'No products found',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ],
                  ),
                );
              }

              return RefreshIndicator(
                onRefresh: () => controller.fetchProducts(),
                child: ListView.builder(
                  itemCount: controller.filteredProducts.length,
                  itemBuilder: (context, index) {
                    final product = controller.filteredProducts[index];

                    return _buildAnimatedProductCard(product, index);
                  },
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedProductCard(product, int index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300 + (index * 50)),
      curve: Curves.easeOut,
      child: TweenAnimationBuilder<double>(
        duration: Duration(milliseconds: 200 + (index * 30)),
        tween: Tween(begin: 0.0, end: 1.0),
        builder: (context, value, child) {
          return Opacity(
            opacity: value,
            child: Transform.translate(
              offset: Offset(0, 10 * (1 - value)),
              child: ProductCard(product: product),
            ),
          );
        },
      ),
    );
  }
}
