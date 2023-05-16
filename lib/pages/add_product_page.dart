import 'package:flutter/material.dart';
import 'package:flutter_gap_talk/controller/product_controller.dart';
import 'package:flutter_gap_talk/models/product.dart';

class AddProductPage extends StatelessWidget {
  AddProductPage({
    required this.productController,
    super.key,
  });

  final ProductController productController;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _stockController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  label: Text('Name'),
                ),
              ),
              TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  label: Text('Description'),
                ),
              ),
              TextField(
                controller: _imageUrlController,
                decoration: const InputDecoration(
                  label: Text('Image URL'),
                ),
              ),
              TextField(
                controller: _priceController,
                decoration: const InputDecoration(
                  label: Text('Price'),
                ),
              ),
              TextField(
                controller: _stockController,
                decoration: const InputDecoration(
                  label: Text('Stock'),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  createProduct();
                  Navigator.pop(context);
                },
                child: const SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: Text('Add Product'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void createProduct() {
    final newProduct = Product(
      id: 0,
      name: _nameController.text,
      description: _descriptionController.text,
      imageUrl: _imageUrlController.text,
      price: double.parse(_priceController.text),
      stock: int.parse(_stockController.text),
    );
    productController.addProduct(newProduct);
  }
}
