import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nusacodes/blocs/product/product_state.dart';
import 'package:flutter_nusacodes/data_resources/network/product_repository.dart';
import 'package:get/get.dart';

class ProductCubit extends Cubit<ProductState> {

  final productRepository = ProductRepository(
    network: Get.find(),
  );

  ProductCubit() : super(const ProductState());

  Future<void> loadData() async {
    emit(state.copyWith(loading: true));
    
    try {
      final response = await productRepository.getList();
      emit(state.copyWith(
        loading: false,
        products: response
      ));
    } catch (e) {
      print('loadData() -> $e');
      emit(state.copyWith(
        loading: false,
      ));
    }
  }

}