class SalesInvoiceItem {
    final int? id;
    final int? saleId;
    final int? productId;
    final int? quantity;
    final String? price;
    final String? totalPrice;

    SalesInvoiceItem({
        this.id,
        this.saleId,
        this.productId,
        this.quantity,
        this.price,
        this.totalPrice,
    });

    factory SalesInvoiceItem.fromJson(Map<String, dynamic> json) => SalesInvoiceItem(
        id: json["id"],
        saleId: json["sale_id"],
        productId: json["product_id"],
        quantity: json["quantity"],
        price: json["price"],
        totalPrice: json["total_price"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "sale_id": saleId,
        "product_id": productId,
        "quantity": quantity,
        "price": price,
        "total_price": totalPrice,
    };
}