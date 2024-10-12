import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nusacodes/blocs/product/product_state.dart';
import 'package:flutter_nusacodes/models/product_model.dart';

class ProductCubit extends Cubit<ProductState> {

  ProductCubit() : super(const ProductState());

  Future<void> loadData() async {
    emit(state.copyWith(loading: true));
    
    await Future.delayed(const Duration(seconds: 1));
    // TODO: Hit enpoint GET data product

    final products = [
      ProductModel(
        id: 1,
        name: "Asus ZenBook 14",
        description: "Description for Asus ZenBook 14",
        price: 10000000,
        stock: 16
      ),
      ProductModel(
        id: 2,
        name: "Asus ZenBook 10",
        description: "Description for Asus ZenBook 10",
        price: 8000000,
        stock: 32
      ),
      ProductModel(
        id: 3,
        name: "iPhone 10",
        description: "Description for Asus iPhone 10",
        price: 6000000,
        stock: 32
      ),
    ];

    emit(state.copyWith(
      loading: false,
      products: products
    ));
  }

}