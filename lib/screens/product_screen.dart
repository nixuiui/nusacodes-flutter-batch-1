import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nusacodes/data_resources/database/product_db.dart';
import 'package:flutter_nusacodes/screens/product_form.dart';
import 'package:flutter_nusacodes/utils/databases/app_database.dart';
import 'package:flutter_nusacodes/utils/helper.dart';
import 'package:get/get.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {

  final db = Get.find<AppDatabase>();

  final productDb = Get.find<ProductDb>();
  // List<Product> products = [];

  Future<void> insert(Product data) async {
    await productDb.createProduct(data);
  }

  Future<void> delete(int id) async {
    await productDb.deleteProduct(id);
  }

  // Future<void> getProducts() async {
  //   final result = await productDb.getListProducts();
  //   setState(() {
  //     products = result;
  //   });
  // }

  Future<void> update(Product data, int id) async {
    await productDb.updateProduct(data, id);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => DriftDbViewer(db)));
            }, 
            icon: const Icon(Icons.storage)
          ),
        ],
      ),
      body: StreamBuilder<List<Product>>(
        stream: productDb.watchListProducts(),
        builder: (context, snapshot) {
          final products = snapshot.data ?? [];
          return ListView.separated(
            itemCount: products.length,
            separatorBuilder: (context, index) => const SizedBox(height: 16), 
            itemBuilder: (context, index) => ListTile(
              title: Text(products[index].name ?? ''),
              subtitle: Text(formatRupiah(products[index].price)),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () => openForm(data: products[index]), 
                    icon: const Icon(Icons.edit)
                  ),
                  IconButton(
                    onPressed: () => delete(products[index].id!), 
                    icon: const Icon(Icons.delete)
                  ),
                ],
              ),
            ), 
          );
        }
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: FilledButton(
          onPressed: () => openForm(), 
          child: const Text('Tambah')
        ),
      ),
    );
  }

  void openForm({
    Product? data
  }) {
    showDialog(
      context: context, 
      builder: (context) {
        return Dialog.fullscreen(
          child: ProductForm(data: data),
        );
      }
    );
  }
}