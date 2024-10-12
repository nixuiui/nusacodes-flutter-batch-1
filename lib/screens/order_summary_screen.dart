import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nusacodes/blocs/order/order_cubit.dart';
import 'package:flutter_nusacodes/blocs/order/order_state.dart';
import 'package:flutter_nusacodes/widgets/product_item_summary_widget.dart';

class OrderSummaryScreen extends StatefulWidget {
  const OrderSummaryScreen({super.key});

  @override
  State<OrderSummaryScreen> createState() => _OrderSummaryScreenState();
}

class _OrderSummaryScreenState extends State<OrderSummaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pesanan'),
      ),
      body: BlocBuilder<OrderCubit, OrderState>(
        builder: (context, state) {
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: state.order?.items?.length ?? 0,
            separatorBuilder: (context, index) => const SizedBox(height: 12), 
            itemBuilder: (context, index) => ProductItemSummaryWidget(
              orderItem: state.order!.items![index],
            ), 
          );
        }
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // TODO: total order
            Text(
              'Total Rp 320.000',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {}, 
                child: const Text('Bayar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}