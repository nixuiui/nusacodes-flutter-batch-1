import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nusacodes/blocs/auth/authentication_state.dart';
import 'package:flutter_nusacodes/models/user_model.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {

  AuthenticationCubit() : super(const AuthenticationState());

  Future<void> login(String email, String password) async {
    emit(state.copyWith(
      status: LoginStatus.loading,
      errorMessage: ''
    ));
    await Future.delayed(const Duration(seconds: 1));
    
    // TODO: Hit enpoint POST /login
    if(email == 'admin@gmail.com' && password == 'admin') {
      final user = User(
        name: 'Admin',
        email: email
      );

      emit(state.copyWith(
        status: LoginStatus.success,
        user: user
      ));
    } else {
      emit(state.copyWith(
        status: LoginStatus.failed,
        errorMessage: 'Email & Password tidak tepat'
      ));
    }
  }

  Future<void> logout() async {
    // TODO: remove access token from local storage
  }

}