import 'package:flutter/material.dart';
import 'package:flutter_nusacodes/consts/app_route.dart';
import 'package:flutter_nusacodes/widgets/product_item_widget.dart';

class PosScreen extends StatefulWidget {
  const PosScreen({super.key});

  @override
  State<PosScreen> createState() => _PosScreenState();
}

class _PosScreenState extends State<PosScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pos'),
      ),
      body: Stack(
        children: [
          ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: 20,
            separatorBuilder: (context, index) => const SizedBox(height: 12), 
            itemBuilder: (context, index) => const ProductItemWidget(), 
          ),
          Positioned(
            left: 16,
            bottom: 16,
            right: 16,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRoute.orderSummaryScreen);
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(16)
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '16 Produk dipilih',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onPrimaryContainer
                          ),
                        ),
                        Text(
                          'Rp 320.000',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onPrimaryContainer
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Icon(Icons.arrow_forward),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}