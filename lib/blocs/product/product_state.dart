import 'package:equatable/equatable.dart';
import 'package:flutter_nusacodes/models/product_model.dart';

class ProductState extends Equatable {

  final List<ProductModel>? products;
  final bool loading;

  const ProductState({
    this.products,
    this.loading = false,
  });

  ProductState copyWith({
    List<ProductModel>? products,
    bool? loading,
  }) => ProductState(
    products: products ?? this.products,
    loading: loading ?? this.loading,
  );

  @override
  List<Object?> get props => [
    products, 
    loading, 
  ];
}