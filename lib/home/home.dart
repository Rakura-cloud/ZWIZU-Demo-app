import 'package:demo/products/products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

@override
Widget build(BuildContext context) {
  return Center(
    child: ElevatedButton(
      child: const Text("Products"),
      onPressed: () {
        Get.to(() => ProductsScreen());
      },
    ),
  );
}
