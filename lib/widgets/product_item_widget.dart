import 'package:flutter/material.dart';
import 'package:flutter_nusacodes/models/product_model.dart';

class ProductItemWidget extends StatelessWidget {
  final ProductModel product;
  final Function(ProductModel)? onAddProduct;
  
  const ProductItemWidget({
    super.key,
    required this.product,
    this.onAddProduct
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => onAddProduct?.call(product),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 20,
                child: Text('P'),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name ?? '',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      product.price?.toString() ?? '',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      'Stok: ${product.stock}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              // Row(
              //   children: [
              //     IconButton.outlined(
              //       onPressed: () {}, 
              //       icon: const Icon(Icons.remove)
              //     ),
              //     SizedBox(
              //       width: 40,
              //       child: Text(
              //         '2',
              //         style: Theme.of(context).textTheme.titleLarge,
              //         textAlign: TextAlign.center,
              //       ),
              //     ),
              //     IconButton.filled(
              //       onPressed: () {}, 
              //       icon: const Icon(Icons.add)
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}