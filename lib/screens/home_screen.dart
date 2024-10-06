import 'package:flutter/material.dart';
import 'package:flutter_nusacodes/screens/counter_screen.dart';
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
            final result = await Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => CounterScreen(
                initialCounter: initialCounter,
              ))
            );

            if(result != null) {
              setState(() {
                initialCounter = result;
              });
            }
          }, 
          child: Text('Open Counter Screen: $initialCounter'),
        ),
      ),
    );
  }
}
