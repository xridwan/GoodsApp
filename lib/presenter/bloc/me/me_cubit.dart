import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecase/login_use_case.dart';
import 'me_state.dart';

class MeCubit extends Cubit<MeState> {
  final MeUseCase _meUseCase;

  MeCubit(this._meUseCase) : super(MeInitial());

  Future<void> fetchMe() async {
    emit(MeLoading());
    final result = await _meUseCase();
    result.fold((failure) => emit(MeFailure(failure.errorMessage)), (data) {
      print("me  use case : ${data.username}");
      return emit(MeSuccess(data));
    });
  }
}
