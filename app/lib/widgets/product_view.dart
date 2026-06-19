import 'package:flutter/material.dart';
import '/clases/class_product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(product.name),
        subtitle: Text("\$${product.price.toString()}"),
      ),
    );
  }
}
