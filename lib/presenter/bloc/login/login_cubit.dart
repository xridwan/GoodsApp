import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecase/login_use_case.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _useCase;

  LoginCubit(this._useCase) : super(LoginInitial());

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    try {
      final result = await _useCase(email, password);
      result.fold(
        (failure) => emit(LoginFailure(failure.errorMessage)),
        (data) => emit(LoginSuccess(data)),
      );
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
