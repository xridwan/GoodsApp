import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecase/login_use_case.dart';
import 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  final LogoutUseCase _useCase;

  LogoutCubit(this._useCase) : super(LogoutInitial());

  Future<void> logout() async {
    emit(LogoutLoading());
    try {
      final result = await _useCase();
      result.fold(
        (failure) => emit(LogoutFailure(failure.toString())),
        (data) => emit(LogoutSuccess(data)),
      );
    } catch (e) {
      emit(LogoutFailure(e.toString()));
    }
  }
}
