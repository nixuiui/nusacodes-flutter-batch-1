import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nusacodes/blocs/product/product_cubit.dart';
import 'package:flutter_nusacodes/screens/home/pos_screen.dart';
import 'package:flutter_nusacodes/screens/home/profile_screen.dart';
import 'package:flutter_nusacodes/screens/home/sales_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key, 
  });


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var index = 0;
  var screens = [
    const PosScreen(),
    const SalesScreen(),
    const ProfileScreen(),
  ];

  final productCubit = ProductCubit();

  @override
  void initState() {
    productCubit.loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => productCubit),
      ],
      child: Scaffold(
        body: screens[index],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (value) => setState(() {
            index = value;
          }),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.point_of_sale),
              label: 'POS'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.description),
              label: 'Penjualan'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile'
            ),
          ]
        ),
      ),
    );
  }
}
