import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecase/home_use_case.dart';
import 'asset_by_loc_state.dart';

class AssetByLocCubit extends Cubit<AssetByLocState> {
  final AssetByLocUseCase _useCase;

  AssetByLocCubit(this._useCase) : super(AssetByLocInitial());

  Future<void> getAssetsByLocation() async {
    emit(AssetByLocLoading());
    try {
      final result = await _useCase();
      result.fold(
        (failure) => emit(AssetByLocFailure(failure.toString())),
        (data) => emit(AssetByLocSuccess(data)),
      );
    } catch (e) {
      emit(AssetByLocFailure(e.toString()));
    }
  }
}
