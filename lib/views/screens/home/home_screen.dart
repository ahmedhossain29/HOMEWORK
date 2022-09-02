import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homework/app_constants.dart';
import 'package:homework/ProductController.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static Future<void> loadData(bool reload) async {
    await Get.find<ProductController>().getAllProducts(reload);
    await Get.find<ProductController>().getAllCategories(reload);
  }

  @override
  Widget build(BuildContext context) {
    loadData(false);

    return Scaffold(
        appBar: AppBar(title: const Text("Home Work"), centerTitle: true),
        body: SafeArea(
            child: RefreshIndicator(
                onRefresh: () async {
                  await Get.find<ProductController>().getAllProducts(true);
                  await Get.find<ProductController>().getAllCategories(true);
                },
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GetBuilder<ProductController>(
                            builder: (productController) {
                          return productController.isVisible == true
                              ? GridView.builder(
                                  itemCount:
                                      productController.productsList.length,
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1,
                                  ),
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        productController.getProductById(productController.productsList[index].id,true);
                                        productController.getCategoryNameByProductId(productController.productsList[index].categoryId,true);
                                        Get.toNamed('/product_details');
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        margin: const EdgeInsets.all(20),
                                        padding: const EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.3),
                                                  blurRadius: 10,
                                                  offset: const Offset(0, 1))
                                            ]),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 400,
                                                height: 200,
                                                child: FadeInImage(
                                                    placeholder: const NetworkImage(
                                                        'https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty.jpg'),
                                                    image: NetworkImage(
                                                        '${AppConstants.BASE_URL}/${productController.productsList[index].thumbImage}'),
                                                    placeholderErrorBuilder:
                                                        (b, o, s) {
                                                      return Image.network(
                                                          'https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty.jpg');
                                                    },
                                                    fit: BoxFit.cover,
                                                    width: 400,
                                                    height: 200),
                                              ),
                                              const SizedBox(height: 5),
                                              Text(
                                                  'Product Name: ${productController.productsList[index].name}'),
                                              Text(
                                                  'Quantity: ${productController.productsList[index].qty}'),
                                              Text(
                                                  'Sold Quantity: ${productController.productsList[index].soldQty}'),
                                              Text(
                                                  'Price: ${productController.productsList[index].price}'),
                                            ]),
                                      ),
                                    );
                                  })
                              : const Center(child: CircularProgressIndicator());
                        })
                      ],
                    ),
                ))));
  }
}
