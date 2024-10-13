import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nusacodes/blocs/order/order_state.dart';
import 'package:flutter_nusacodes/models/order_model.dart';
import 'package:flutter_nusacodes/models/product_model.dart';

class OrderCubit extends Cubit<OrderState> {

  OrderCubit() : super(const OrderState());

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

  void setPaymentMethod(String paymentMethod) {

  }

}