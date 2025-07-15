import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webplat_assignment/product_screen/bindings/binding.dart';
import 'package:webplat_assignment/product_screen/product_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialBinding: ProductBinding(),
      home: ProductListScreen(),
    );
  }
}
