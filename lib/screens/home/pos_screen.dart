import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nusacodes/blocs/order/order_cubit.dart';
import 'package:flutter_nusacodes/blocs/order/order_state.dart';
import 'package:flutter_nusacodes/blocs/product/product_cubit.dart';
import 'package:flutter_nusacodes/blocs/product/product_state.dart';
import 'package:flutter_nusacodes/consts/app_route.dart';
import 'package:flutter_nusacodes/utils/helper.dart';
import 'package:flutter_nusacodes/widgets/product_item_widget.dart';

class PosScreen extends StatefulWidget {
  const PosScreen({super.key});

  @override
  State<PosScreen> createState() => _PosScreenState();
}

class _PosScreenState extends State<PosScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pos'),
      ),
      body: Stack(
        children: [
          BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              if(state.loading) {
                return const Center(child: CircularProgressIndicator());
              }
              return RefreshIndicator(
                onRefresh: context.read<ProductCubit>().loadData,
                child: ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: state.products?.length ?? 0,
                  separatorBuilder: (context, index) => const SizedBox(height: 12), 
                  itemBuilder: (context, index) => ProductItemWidget(
                    product: state.products![index],
                    onAddProduct: context.read<OrderCubit>().addProduct,
                  ), 
                ),
              );
            }
          ),
          _buildOrderSummary(context),
        ],
      ),
    );
  }

  Widget _buildOrderSummary(BuildContext context) {
    return Positioned(
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
          child: BlocBuilder<OrderCubit, OrderState>(
            builder: (context, state) {
              return Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${state.order?.items?.length ?? 0} Produk dipilih',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimaryContainer
                        ),
                      ),
                      Text(
                        formatRupiah(state.order?.totalPrice),
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimaryContainer
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Icon(Icons.arrow_forward),
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}