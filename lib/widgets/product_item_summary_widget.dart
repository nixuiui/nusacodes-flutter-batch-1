import 'package:flutter/material.dart';

class ProductItemSummaryWidget extends StatelessWidget {
  const ProductItemSummaryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
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
                    'Produk',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    '2x Rp 20.000',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}