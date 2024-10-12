import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nusacodes/blocs/auth/authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {

  AuthenticationCubit() : super(const AuthenticationState());

  Future<void> login(String username, String password) async {
    emit(state.copyWith(
      status: LoginStatus.loading,
      errorMessage: ''
    ));
    await Future.delayed(const Duration(seconds: 1));
    
    // TODO: Hit enpoint POST /login
    if(username == 'admin' && password == 'admin') {
      emit(state.copyWith(
        status: LoginStatus.success,
      ));
    } else {
      emit(state.copyWith(
        status: LoginStatus.failed,
        errorMessage: 'Username & Password tidak tepat'
      ));
    }
  }

}