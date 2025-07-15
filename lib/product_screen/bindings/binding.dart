
import 'package:get/get.dart';
import 'package:webplat_assignment/product_screen/controller/product_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(()=> ProductController());
  }

}