

import 'package:flutter_nusacodes/models/product_model.dart';

class OrderModel {
    final List<OrderItem>? items;
    final int? paymentAmount;
    final String? paymentMethod;

    OrderModel({
        this.items,
        this.paymentAmount,
        this.paymentMethod,
    });

    factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        items: json["items"] == null ? [] : List<OrderItem>.from(json["items"]!.map((x) => OrderItem.fromJson(x))),
        paymentAmount: json["payment_amount"],
        paymentMethod: json["payment_method"],
    );

    Map<String, dynamic> toJson() => {
        "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
        "payment_amount": paymentAmount,
        "payment_method": paymentMethod,
    };
}


class OrderItem {
    final int? productId;
    final int? quantity;
    final double? pricePerItem;
    final ProductModel? product;

    OrderItem({
        this.productId,
        this.quantity,
        this.pricePerItem,
        this.product,
    });

    double get totalPrice => (quantity ?? 0) * (pricePerItem ?? 0);

    factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        productId: json["product_id"],
        quantity: json["quantity"],
        pricePerItem: json["price_per_item"],
    );

    Map<String, dynamic> toJson() => {
        "product_id": productId,
        "quantity": quantity,
        "price_per_item": pricePerItem,
    };
}