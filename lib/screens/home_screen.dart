import 'package:flutter/material.dart';
import 'package:flutter_nusacodes/consts/app_route.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key, 
  });


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var initialCounter = 0;

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
      ),
      body: Center(
        child: FilledButton(
          onPressed: () async {
            final result = await Navigator.pushNamed(
              context, 
              AppRoute.counterScreen, 
              arguments: initialCounter
            );

            if(result != null) {
              setState(() {
                initialCounter = result as int;
              });
            }
          }, 
          child: Text('Open Counter Screen: $initialCounter'),
        ),
      ),
    );
  }
}
