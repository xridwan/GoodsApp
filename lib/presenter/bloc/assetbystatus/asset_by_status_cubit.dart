import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecase/home_use_case.dart';
import 'asset_by_status_state.dart';

class AssetByStatusCubit extends Cubit<AssetByStatusState> {
  final AssetByStatusUseCase _useCase;

  AssetByStatusCubit(this._useCase) : super(AssetByStatusInitial());

  Future<void> getAssetsByStatus() async {
    emit(AssetByStatusLoading());
    try {
      final result = await _useCase();
      result.fold(
        (failure) => emit(AssetByStatusFailure(failure.toString())),
        (data) => emit(AssetByStatusSuccess(data)),
      );
    } catch (e) {
      emit(AssetByStatusFailure(e.toString()));
    }
  }
}
