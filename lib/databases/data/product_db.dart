import 'package:flutter_nusacodes/databases/app_database.dart';

class ProductDb {

  late final AppDatabase db;

  ProductDb(this.db);

  Future<void> createProduct(Product data) async {
    await db.into(db.products).insert(data);
  }

  Future<void> bulkProduct(List<Product> data) async {
    await db.batch((batch) {
      batch.insertAll(db.products, data);
    });
  }

  Future<List<Product>> getListProducts() async {
    return await db.select(db.products).get();
  }

  Future<void> updateProduct(Product data, int id) async {
    await (db.update(db.products)..where((tbl) => tbl.id.equals(id))).write(data);
  }

  Future<void> deleteProduct(int id) async {
    await (db.delete(db.products)..where((tbl) => tbl.id.equals(id))).go();
  }

}