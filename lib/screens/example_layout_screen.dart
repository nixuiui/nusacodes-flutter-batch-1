import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ExampleLayoutScreen extends StatefulWidget {
  const ExampleLayoutScreen({
    super.key, 
  });


  @override
  State<ExampleLayoutScreen> createState() => _ExampleLayoutScreenState();
}

class _ExampleLayoutScreenState extends State<ExampleLayoutScreen> {

  final products = [
    'iPhone X',
    'iPhone 11',
    'iPhone 12',
    'iPhone 13',
    'iPhone 14',
    'iPhone 15',
    'iPhone 16',
    'Macbook M1',
    'Macbook M1 Pro',
    'Macbook M1 Air',
    'Samsung Galaxy',
    'Samsung Galaxy s12',
    'Samsung Galaxy s12 Ultra',
    'Samsung Galaxy s12 Ultrasonic',
    'Xiaomi',
    'OPO',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home Screen',
          style: TextStyle(
            fontSize: 32,
            fontFamily: GoogleFonts.afacad().fontFamily
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.changeTheme(Get.isDarkMode ? ThemeData.light(): ThemeData.dark());
            }, 
            icon: Icon(Get.isDarkMode ? Icons.dark_mode : Icons.light_mode)
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Icon(Icons.home),
          FilledButton.icon(
            onPressed: () {},
            label: const Text('Click Me'),
            icon: const Icon(Icons.add),
          ),
          FilledButton(
            onPressed: () {}, 
            child: const Text('Click Me')
          ),
          FilledButton.tonal(
            onPressed: () {}, 
            child: const Text('Click Me')
          ),
          FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 16),
          GridView(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            children: List.generate(9, (index) => Container(
              color: index % 2 == 0 ? Colors.red : Colors.orange,
            )),
          ),
          const SizedBox(height: 16),
          GridView.count(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            crossAxisCount: 5,
            childAspectRatio: 1/1,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            children: List.generate(10, (index) => Container(
              color: index % 2 == 0 ? Colors.red : Colors.orange,
            )),
          ),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemCount: 9,
            itemBuilder: (context, index) => Container(
              color: index % 2 == 0 ? Colors.red : Colors.orange,
            ),
          ),
          const SizedBox(height: 16,),
          SizedBox(
            height: 100,
            child: Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.black,
                ),  
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: List.generate(10, (index) => Container(
                      width: 100,
                      height: 100,
                      color: index % 2 == 0 ? Colors.red : Colors.orange,
                    )),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          ListView.separated(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: products.length,
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              return ListTile(
                tileColor: Colors.blue,
                title: Text(products[index]),
              );
            }
          ),
          const Divider(),
          ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ListTile(
                tileColor: Colors.orange,
                title: Text(products[index]),
              );
            }
          ),
          const Divider(),
          ListView(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            children: products.map((e) => ListTile(
              title: Text(e),
            )).toList(),
          ),
        ],
      ),
    );
  }
}
