import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homework/ProductController.dart';
import 'package:homework/app_constants.dart';
import 'package:homework/views/screens/home/reviewPage.dart';
import 'package:homework/views/screens/home/sellerInfoPage.dart';
import 'package:homework/views/screens/home/widgets/layout_with_appbar.dart';
import 'package:homework/views/screens/home/widgets/product_images.dart';

import 'descriptionPage.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  static Future<void> loadData(bool reload) async {}
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, initialIndex: 0, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    loadData(false);
    return LayoutWithAppBar(
        onRefresh: () async {},
        isAppBarPinned: true,
        title: 'Popular Sells',
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(children: [
              GetBuilder<ProductController>(builder: (productController) {
                return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProductImages(
                            baseUrl: AppConstants.BASE_URL,
                            controller: productController,
                          ),
                          const SizedBox(height: 20),
                          Row(children: [
                            Text("\$${productController.product?.offerPrice}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25)),
                            const SizedBox(width: 10),
                            Text("\$${productController.product?.price}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black38)),
                          ]),
                          const SizedBox(height: 10),
                          Text(
                              "${productController.getCategory?.name} - ${productController.getCategory?.activeSubCategories?[0].name}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.black38)),
                          const SizedBox(height: 15),
                          Text("${productController.product?.name}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.black)),
                          const SizedBox(height: 10),
                          Row(children: [
                            Wrap(
                                children: List.generate(
                                    5,
                                    (index) => const Icon(Icons.star,
                                        color: Colors.yellow, size: 25))),
                            const SizedBox(width: 10),
                            const Text("6 Reviews"),
                          ]),
                          const SizedBox(height: 10),
                          Text("${productController.product?.slug}")
                        ]));
              }),
              const SizedBox(height: 5),
              Container(
                width: MediaQuery.of(context).size.width,
                color: Theme.of(context).cardColor,
                child: TabBar(
                  controller: _tabController,
                  indicatorColor: Theme.of(context).primaryColor,
                  indicatorWeight: 3,
                  labelColor: Theme.of(context).primaryColor,
                  unselectedLabelColor: Theme.of(context).disabledColor,
                  tabs: const [
                    Tab(text: 'Description'),
                    Tab(text: 'Review'),
                    Tab(text: 'Seller Info'),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height / 2,
                child: TabBarView(controller: _tabController, children: [
                  Description(),
                  const Review(),
                  const SellerInfo()
                ]),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.only(right: 210),
                height: 200,
                child: const Text(
                  "Related Product",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      color: Colors.black12,
                      child: const Icon(Icons.shopping_cart),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 50,
                      width: 300,
                      color: Colors.yellow,
                      child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Add To Cart",
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          )),
                    ),
                  ],
                ),
              ),
            ])));
  }
}
// home work