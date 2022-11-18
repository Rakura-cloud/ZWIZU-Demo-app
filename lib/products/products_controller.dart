import 'package:get/get.dart';
import '/model/products_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductController extends GetxController {
  var products = List<Product>.empty(growable: true).obs;

  RxInt skip = 0.obs;
  int limit = 20;

  @override
  void onInit() {
    super.onInit();
    fetchProducts(skip.toInt());
  }

  fetchProducts(int skip) async {
    Uri uri =
        Uri.parse('https://dummyjson.com/products?limit=$limit&skip=$skip');

    var response = await http.get(uri);
    if (response.statusCode == 200) {
      Map<String, dynamic> filter = jsonDecode(response.body);
      //List<Product> data = filter["products"];

      //List<Product> data = json.decode(filter.produ);

      List<Product> data = (filter['products'] as List)
          .map((itemWord) => Product.fromJson(itemWord))
          .toList();

      products.value = data.toList();
    }
  }

  void addItem(int skip) async {
    Uri uri =
        Uri.parse('https://dummyjson.com/products?limit=$limit&skip=$skip');

    var response = await http.get(uri);
    if (response.statusCode == 200) {
      Map<String, dynamic> filter = jsonDecode(response.body);
      //List<Product> data = filter["products"];

      //List<Product> data = json.decode(filter.produ);

      List<Product> data = (filter['products'] as List)
          .map((itemWord) => Product.fromJson(itemWord))
          .toList();

      products.addAll(data);
    }
  }
}
