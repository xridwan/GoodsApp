import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goods_app/presenter/bloc/status/status_state.dart';

import '../../../domain/usecase/status_use_case.dart';

class StatusCubit extends Cubit<StatusState> {
  final StatusUseCase _useCase;

  StatusCubit(this._useCase) : super(StatusInitial());

  Future<void> getStatuses() async {
    emit(StatusLoading());
    try {
      final result = await _useCase();
      result.fold(
        (failure) => emit(StatusFailure(failure.toString())),
        (data) => emit(StatusSuccess(data)),
      );
    } catch (e) {
      emit(StatusFailure(e.toString()));
    }
  }
}
