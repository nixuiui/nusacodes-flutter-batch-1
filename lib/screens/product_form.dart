import 'package:flutter/material.dart';
import 'package:flutter_nusacodes/data_resources/database/product_db.dart';
import 'package:flutter_nusacodes/utils/databases/app_database.dart';
import 'package:get/get.dart';

class ProductForm extends StatefulWidget {

  final Product? data;

  const ProductForm({
    super.key,
    this.data
  });

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {

  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final productDb = Get.find<ProductDb>();

  @override
  void initState() {
    if(widget.data != null) {
      nameController.text = widget.data?.name ?? '';
      priceController.text = widget.data?.price?.toString() ?? '';
    }
    super.initState();
  }

  void save() async {
    if(widget.data != null) {
      productDb.updateProduct(Product(
        name: nameController.text,
        price: double.tryParse(priceController.text),
      ), widget.data!.id!);
    } else {
      productDb.createProduct(Product(
        name: nameController.text,
        price: double.tryParse(priceController.text),
      ));
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Produk"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          TextFormField(
            decoration: const InputDecoration(
              hintText: "Nama Produk",
              labelText: 'Nama Produk'
            ),
            controller: nameController,
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(
              hintText: "Harga Produk",
              labelText: 'Harga Produk'
            ),
            keyboardType: TextInputType.number,
            controller: priceController,
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: FilledButton(
          onPressed: save, 
          child: const Text('Simpan')
        ),
      ),
    );
  }
}