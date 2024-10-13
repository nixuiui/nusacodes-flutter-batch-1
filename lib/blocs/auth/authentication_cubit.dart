import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nusacodes/blocs/auth/authentication_state.dart';
import 'package:flutter_nusacodes/repositories/authentication_repository.dart';
import 'package:flutter_nusacodes/utils/network_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {

  final authenticationRepository = AuthenticationRepository();

  AuthenticationCubit() : super(const AuthenticationState());

  Future<void> login(String email, String password) async {
    emit(state.copyWith(
      status: LoginStatus.loading,
      errorMessage: ''
    ));
    await Future.delayed(const Duration(seconds: 1));

    try {
      final response = await authenticationRepository.login(email, password);
      emit(state.copyWith(
        status: LoginStatus.success,
        user: response
      ));
    } on NetworkException catch (e) {
      emit(state.copyWith(
        status: LoginStatus.failed,
        errorMessage: "$e",
      ));
    }
  }

  Future<bool> checkLogin() async {
    print('checkLogin:');
    final prefs = await SharedPreferences.getInstance();
    print('checkLogin: 2');
    final token = prefs.getString('token');
    print('checkLogin: token');
    return token?.isNotEmpty ?? false;
  }

  Future<void> logout() async {
    // TODO: remove access token from local storage
  }

}