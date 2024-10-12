import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nusacodes/blocs/auth/authentication_cubit.dart';
import 'package:flutter_nusacodes/consts/app_route.dart';
import 'package:flutter_nusacodes/screens/counter_screen.dart';
import 'package:flutter_nusacodes/screens/home/home_screen.dart';
import 'package:flutter_nusacodes/screens/login_screen.dart';
import 'package:flutter_nusacodes/screens/order_summary_screen.dart';
import 'package:flutter_nusacodes/screens/register_screen.dart';
import 'package:flutter_nusacodes/screens/splash_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthenticationCubit()),
      ],
      child: GetMaterialApp(
        title: 'Flutter Demo',
        theme: FlexThemeData.light(
          scheme: FlexScheme.greyLaw,
          surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
          blendLevel: 7,
          subThemesData: const FlexSubThemesData(
            blendOnLevel: 10,
            blendOnColors: false,
            useTextTheme: true,
            useM2StyleDividerInM3: true,
            alignedDropdown: true,
            useInputDecoratorThemeInDialogs: true,
          ),
          visualDensity: FlexColorScheme.comfortablePlatformDensity,
          useMaterial3: true,
          swapLegacyOnMaterial3: true,
          // To use the Playground font, add GoogleFonts package and uncomment
          // fontFamily: GoogleFonts.notoSans().fontFamily,
        ),
        darkTheme: FlexThemeData.dark(
          scheme: FlexScheme.espresso,
          surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
          blendLevel: 13,
          subThemesData: const FlexSubThemesData(
            blendOnLevel: 20,
            useTextTheme: true,
            useM2StyleDividerInM3: true,
            alignedDropdown: true,
            useInputDecoratorThemeInDialogs: true,
          ),
          visualDensity: FlexColorScheme.comfortablePlatformDensity,
          useMaterial3: true,
          swapLegacyOnMaterial3: true,
          // To use the Playground font, add GoogleFonts package and uncomment
          // fontFamily: GoogleFonts.notoSans().fontFamily,
        ),
        initialRoute: AppRoute.splashScreen,
        routes: {
          AppRoute.splashScreen: (context) => const SplashScreen(),
          AppRoute.homeScreen: (context) => const HomeScreen(),
          AppRoute.loginScreen: (context) => const LoginScreen(),
          AppRoute.registerScreen: (context) => const RegisterScreen(),
          AppRoute.orderSummaryScreen: (context) => const OrderSummaryScreen(),
          AppRoute.counterScreen: (context) {
            final arguments = ModalRoute.of(context)!.settings.arguments as int;
            return CounterScreen(initialCounter: arguments);
          },
        },
      ),
    );
  }
}
