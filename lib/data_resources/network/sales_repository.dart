import 'package:flutter_nusacodes/models/order_model.dart';
import 'package:flutter_nusacodes/models/sales_invoice_model.dart';
import 'package:flutter_nusacodes/utils/network_service.dart';

class SalesRepository {

  late final NetworkService network;

  SalesRepository(this.network);

  Future<SalesInvoiceModel> postCreateInvoice(OrderModel order) async {
    final response = await network.post(
      url: "/api/sales/create",
      data: order.toJson()
    );
    
    return SalesInvoiceModel.fromJson(response.data['data']);
  }
}