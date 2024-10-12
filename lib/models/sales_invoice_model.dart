import 'package:flutter_nusacodes/models/payment_model.dart';
import 'package:flutter_nusacodes/models/sales_invoice_item_model.dart';

class SalesInvoiceModel {
    final int? id;
    final int? userId;
    final String? totalPrice;
    final DateTime? saleDate;
    final List<SalesInvoiceItem>? items;
    final List<Payment>? payments;

    SalesInvoiceModel({
        this.id,
        this.userId,
        this.totalPrice,
        this.saleDate,
        this.items,
        this.payments,
    });

    factory SalesInvoiceModel.fromJson(Map<String, dynamic> json) => SalesInvoiceModel(
        id: json["id"],
        userId: json["user_id"],
        totalPrice: json["total_price"],
        saleDate: json["sale_date"] == null ? null : DateTime.parse(json["sale_date"]),
        items: json["items"] == null ? [] : List<SalesInvoiceItem>.from(json["items"]!.map((x) => SalesInvoiceItem.fromJson(x))),
        payments: json["payments"] == null ? [] : List<Payment>.from(json["payments"]!.map((x) => Payment.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "total_price": totalPrice,
        "sale_date": saleDate?.toIso8601String(),
        "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
        "payments": payments == null ? [] : List<dynamic>.from(payments!.map((x) => x.toJson())),
    };
}
