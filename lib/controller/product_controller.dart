import 'package:flutter/material.dart';
import 'package:flutter_gap_talk/models/product.dart';
import 'package:flutter_gap_talk/services/products_service.dart';

enum ProductListStatus {
  initial,
  loading,
  loaded,
  failure,
}

class ProductController extends ChangeNotifier {
  ProductController({
    required ProductsService productsService,
  }) : _service = productsService {
    status = ProductListStatus.initial;
    products = [];
  }

  final ProductsService _service;
  late ProductListStatus status;
  late List<Product> products;

  Future<List<Product>> getProducts() async {
    try {
      status = ProductListStatus.loading;
      notifyListeners();
      final responseProducts = await _service.getProducts();
      products = responseProducts;
      status = ProductListStatus.loaded;
      notifyListeners();
      return products;
    } catch (e) {
      status = ProductListStatus.failure;
      notifyListeners();
      rethrow;
    }
  }

  void addProduct(Product product) async {
    try {
      await _service.addProduct(product);
      getProducts();
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
