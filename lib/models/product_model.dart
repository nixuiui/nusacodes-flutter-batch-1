class ProductModel {
    final int? id;
    final String? name;
    final String? description;
    final double? price;
    final int? stock;

    ProductModel({
        this.id,
        this.name,
        this.description,
        this.price,
        this.stock,
    });

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        stock: json["stock"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "stock": stock,
    };
}