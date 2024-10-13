import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nusacodes/blocs/auth/authentication_cubit.dart';
import 'package:flutter_nusacodes/consts/app_route.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    context.read<AuthenticationCubit>().checkLogin().then((loggedIn) {
      if(loggedIn) {
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.pushReplacementNamed(context, AppRoute.homeScreen);
        });
      } else {
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.pushReplacementNamed(context, AppRoute.loginScreen);
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('SPLASH SCREEN')
      ),
    );
  }
}