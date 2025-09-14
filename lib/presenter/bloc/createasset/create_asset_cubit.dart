import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecase/asset_use_case.dart';
import 'create_asset_state.dart';

class CreateAssetCubit extends Cubit<CreateAssetState> {
  final CreateAssetUseCase _useCase;

  CreateAssetCubit(this._useCase) : super(CreateAssetInitial());

  Future<void> createAsset(
    String name,
    String statusId,
    String locationId,
  ) async {
    emit(CreateAssetLoading());
    try {
      final result = await _useCase(name, statusId, locationId);
      result.fold(
        (failure) => emit(CreateAssetFailure(failure.errorMessage)),
        (data) => emit(CreateAssetSuccess(data)),
      );
    } catch (e) {
      emit(CreateAssetFailure(e.toString()));
    }
  }
}
