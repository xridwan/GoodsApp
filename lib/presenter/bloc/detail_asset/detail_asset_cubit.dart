import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecase/asset_use_case.dart';
import 'detail_asset_state.dart';

class DetailAssetCubit extends Cubit<DetailAssetState> {
  final DetailAssetUseCase _useCase;

  DetailAssetCubit(this._useCase) : super(DetailAssetInitial());

  Future<void> fetchDetail(String id) async {
    emit(DetailAssetLoading());
    try {
      final result = await _useCase(id);
      result.fold(
        (failure) => emit(DetailAssetFailure(failure.toString())),
        (data) => emit(DetailAssetSuccess(data)),
      );
    } catch (e) {
      emit(DetailAssetFailure(e.toString()));
    }
  }
}
