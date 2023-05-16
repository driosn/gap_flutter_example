import 'package:flutter/material.dart';
import 'package:flutter_gap_talk/controller/product_controller.dart';
import 'package:flutter_gap_talk/pages/add_product_page.dart';
import 'package:flutter_gap_talk/services/products_service.dart';
import 'package:flutter_gap_talk/widgets/product_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ProductController _productController;

  @override
  void initState() {
    _productController = ProductController(
      productsService: ProductsService(),
    );
    _productController.getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductController>.value(
      value: _productController,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddProductPage(
                  productController: _productController,
                ),
              ),
            );
          },
        ),
        backgroundColor: Colors.blue.shade100,
        appBar: AppBar(
          title: const Text('Products'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Consumer<ProductController>(
            builder: (context, productController, child) {
              final status = productController.status;
              if (status == ProductListStatus.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (status == ProductListStatus.loaded) {
                final products = productController.products;
                return ListView.separated(
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                  itemCount: products.length,
                  itemBuilder: (context, index) => ProductCard(
                    product: products[index],
                  ),
                );
              }

              if (status == ProductListStatus.failure) {
                return const Center(
                  child: Text('Something happened loading products'),
                );
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
