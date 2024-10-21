import 'package:flutter_nusacodes/models/product_model.dart';
import 'package:flutter_nusacodes/utils/network_service.dart';

class ProductRepository {

  late final NetworkService network;

  ProductRepository({
    required this.network
  });

  Future<List<Product>> getList() async {
    final response = await network.get(
      url: "/api/product/list",
      parameters: {
        "page": 1,
        "size": 20,
        "search": null
      }
    );
    
    return List<Product>.from((response.data['data']['data'] ?? []).map((x) => Product.fromJson(x)));
  }
}