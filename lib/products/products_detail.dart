import 'package:flutter/material.dart';
import 'package:demo/products/products_controller.dart';
import 'package:get/get.dart';

class ProductsScreenDetail extends StatelessWidget {
  ProductsScreenDetail({super.key});

  final productController = Get.put(ProductController());
  final id = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            '${productController.products[id].brand} - ${productController.products[id].title}'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 250,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: productController.products[id].images.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.network(
                      productController.products[id].images[index],
                    ),
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(
                vertical: 5, horizontal: 10),
            child: Text(
              productController.products[id].brand,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          FittedBox(
            fit: BoxFit.cover,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:
                      const EdgeInsetsDirectional.symmetric(horizontal: 10),
                  child: Text(
                    productController.products[id].title,
                    style: const TextStyle(fontSize: 30),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.symmetric(horizontal: 5),
                      child: Text(
                        "${productController.products[id].price} €",
                        style: const TextStyle(fontSize: 30),
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.sell_outlined,
                          size: 15,
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.symmetric(
                              horizontal: 5),
                          child: Text(
                            '${productController.products[id].discountPercentage} %',
                            style: const TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                Chip(
                  backgroundColor: Colors.blue.shade50,
                  avatar: const Icon(Icons.category_outlined),
                  label: Text(productController.products[id].category),
                ),
                const SizedBox(
                  width: 7,
                ),
                Chip(
                  backgroundColor: Colors.blue.shade50,
                  avatar: const Icon(Icons.star_outline),
                  label: Text(productController.products[id].rating.toString()),
                ),
                const SizedBox(
                  width: 7,
                ),
                const SizedBox(
                  width: 7,
                ),
                Chip(
                  backgroundColor: Colors.blue.shade50,
                  avatar: const Icon(Icons.inventory_2_outlined),
                  label: Text('${productController.products[id].stock} psc'),
                ),
              ],
            ),
          ),
          const Padding(
            padding:
                EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              "Descriprion",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              width: 500,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: Colors.blue.shade50,
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Text(productController.products[id].description),
              ),
            ),
          )
        ],
      ),
    );
  }
}
