import 'package:equatable/equatable.dart';
import 'package:flutter_nusacodes/models/order_model.dart';

class OrderState extends Equatable {

  final OrderModel? order;
  final bool loading;

  const OrderState({
    this.order,
    this.loading = false,
  });

  OrderState copyWith({
    OrderModel? order,
    bool? loading,
  }) => OrderState(
    order: order ?? this.order,
    loading: loading ?? this.loading,
  );

  @override
  List<Object?> get props => [
    order, 
    loading, 
  ];
}