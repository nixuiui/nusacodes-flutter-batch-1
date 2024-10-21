import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nusacodes/blocs/order/order_state.dart';
import 'package:flutter_nusacodes/models/order_model.dart';
import 'package:flutter_nusacodes/models/product_model.dart';
import 'package:flutter_nusacodes/repositories/sales_repository.dart';

class OrderCubit extends Cubit<OrderState> {

  late final SalesRepository salesRepository;

  OrderCubit(
    this.salesRepository
  ) : super(const OrderState());

  void addProduct(Product product) {
    final orderItem = OrderItem(
      productId: product.id,
      quantity: 1,
      pricePerItem: product.price,
      product: product
    );

    if(state.order == null) {
      final newOrder = OrderModel(
        items: [orderItem]
      );
      emit(state.copyWith(order: newOrder));
    } else {
      final updatedItems = List<OrderItem>.from(state.order?.items ?? [])..add(orderItem);
      final updatedOrder = state.order!.copyWith(items: updatedItems);
      emit(state.copyWith(order: updatedOrder));
    }

    print('state.order: ${state.order?.items?.length ?? 0}');
  }

  void updateQtyProduct({
    required int productId,
    required int qty,
  }) {

  }

  Future<void> createInvoice({
    required int paymentAmount,
    required String paymentMethod,
  }) async {
    emit(state.copyWith(status: CreateInvoiceStatus.loading));
    try {
      final order = OrderModel(
        items: state.order?.items,
        paymentAmount: paymentAmount,
        paymentMethod: paymentMethod,
      );

      await salesRepository.postCreateInvoice(order);
      print('aaaa');
      emit(state.copyWith(status: CreateInvoiceStatus.success));
    } catch (e) {
      print('bbbb: $e');
      emit(state.copyWith(
        status: CreateInvoiceStatus.failed,
      ));
    }
  }

}