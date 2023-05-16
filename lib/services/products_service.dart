import 'package:dio/dio.dart';
import 'package:flutter_gap_talk/models/product.dart';

class ProductsService {
  final Dio _client = Dio();

  static const baseUrl = 'https://demoapi20230513141905.azurewebsites.net/api/';

  Future<List<Product>> getProducts() async {
    final response = await _client.get('$baseUrl/products/');

    if (response.statusCode == 200) {
      return List<Product>.from(
        response.data.map(
          (productJson) => Product.fromJson(productJson),
        ),
      );
    }

    throw Exception('Something happened when fetching products');
  }

  Future<void> addProduct(Product product) async {
    final response =
        await _client.post('$baseUrl/products/', data: product.toJson());

    if (response.statusCode == 201) {
      return;
    }

    throw Exception('Something happened when adding product');
  }
}
