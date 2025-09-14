import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goods_app/presenter/bloc/token/token_state.dart';

import '../../../domain/usecase/login_use_case.dart';

class TokenCubit extends Cubit<TokenState> {
  final GetTokenUseCase _useCase;

  TokenCubit(this._useCase) : super(TokenInitial());

  Future<void> fetchToken() async {
    emit(TokenLoading());
    try {
      final result = await _useCase();
      if (result.isNotEmpty) {
        emit(TokenLoaded(result));
      } else {
        emit(TokenEmpty());
      }
    } catch (e) {
      emit(TokenError(e.toString()));
    }
  }
}
