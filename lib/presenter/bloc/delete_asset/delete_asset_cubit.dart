import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecase/asset_use_case.dart';
import 'delete_asset_state.dart';

class DeleteAssetCubit extends Cubit<DeleteAssetState> {
  final DeleteAssetUseCase _useCase;

  DeleteAssetCubit(this._useCase) : super(DeleteAssetInitial());

  Future<void> deleteAsset(String id) async {
    emit(DeleteAssetLoading());
    final result = await _useCase(id);
    result.fold(
      (failure) => emit(DeleteAssetFailure(failure.errorMessage)),
      (data) => emit(DeleteAssetSuccess(data)),
    );
  }
}
