
import 'package:get/get.dart';
import 'package:homework/product_repository.dart';

import 'ProductController.dart';

Future<void> init() async {
  //Repository
  Get.lazyPut(() => ProductRepository());

  //Controller
  Get.lazyPut(() => ProductController(productRepository: Get.find()));

}