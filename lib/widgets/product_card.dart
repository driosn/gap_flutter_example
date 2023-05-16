import 'package:flutter/material.dart';
import 'package:flutter_gap_talk/models/product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({required this.product, super.key});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    product.description,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'Stock: ${product.stock}',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 70,
              width: 70,
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
