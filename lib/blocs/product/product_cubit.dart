import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nusacodes/blocs/product/product_state.dart';
import 'package:flutter_nusacodes/repositories/product_repository.dart';

class ProductCubit extends Cubit<ProductState> {

  final productRepository = ProductRepository();

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