import 'package:demo/products/products_detail.dart';
import 'package:flutter/material.dart';
import 'package:demo/products/products_controller.dart';
import 'package:get/get.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({super.key});

  final productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ProductController>(builder: (controller) {
                if (controller.products.isEmpty) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.builder(
                    itemCount: controller.products.length + 1,
                    itemBuilder: (context, index) {
                      if (index < controller.products.length) {
                        return Card(
                          child: ListTile(
                            leading: Image.network(
                              controller.products[index].thumbnail,
                              scale: 10,
                            ),
                            title: Text(controller.products[index].brand),
                            subtitle:
                                Text(controller.products[index].description),
                            onTap: () {
                              Get.to(() => ProductsScreenDetail(),
                                  arguments: controller.products[index].id - 1);
                            },
                          ),
                        );
                      } else {
                        if (productController.skip >= 100) {
                          return Center(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                  'Loaded $index items out of ${controller.products.length}'),
                            ),
                          );
                        } else {
                          productController.skip = productController.skip + 20;
                          productController
                              .addItem(productController.skip.toInt());

                          return const Padding(
                            padding: EdgeInsets.all(15),
                            child: Center(child: CircularProgressIndicator()),
                          );
                        }
                      }
                    },
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
