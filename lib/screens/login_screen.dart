import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nusacodes/blocs/auth/authentication_cubit.dart';
import 'package:flutter_nusacodes/blocs/auth/authentication_state.dart';
import 'package:flutter_nusacodes/consts/app_route.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if(state.status == LoginStatus.failed) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.errorMessage ?? '')
          ));
        } else if(state.status == LoginStatus.success) {
          Navigator.pushReplacementNamed(context, AppRoute.homeScreen);
        }
      },
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Logins',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    hintText: 'Username'
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                  ),
                ),
                const SizedBox(height: 16),
                BlocBuilder<AuthenticationCubit, AuthenticationState>(
                  builder: (context, state) {
                    if(state.errorMessage?.isNotEmpty ?? false) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        child: Text(state.errorMessage!, style: const TextStyle(color: Colors.red)),
                      );
                    }
                    return const SizedBox.shrink();
                  }
                ),
                SizedBox(
                  width: double.infinity,
                  child: BlocBuilder<AuthenticationCubit, AuthenticationState>(
                    builder: (context, state) {
                      final isLoading = state.status == LoginStatus.loading;
                      return FilledButton(
                        onPressed: isLoading ? null : () {
                          context.read<AuthenticationCubit>().login(
                            usernameController.text, 
                            passwordController.text
                          );
                        }, 
                        child: Text(isLoading ? 'Loading...' : 'Login')
                      );
                    }
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoute.registerScreen);
                    }, 
                    child: const Text('Register')
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}