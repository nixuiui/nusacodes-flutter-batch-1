import 'package:flutter/material.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({
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
                    'Rp 20.000',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    'Qty: 2 unit',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                IconButton.outlined(
                  onPressed: () {}, 
                  icon: const Icon(Icons.remove)
                ),
                SizedBox(
                  width: 40,
                  child: Text(
                    '2',
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
                IconButton.filled(
                  onPressed: () {}, 
                  icon: const Icon(Icons.add)
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}