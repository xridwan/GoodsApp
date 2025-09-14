import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecase/asset_use_case.dart';
import 'asset_state.dart';

class AssetsCubit extends Cubit<AssetsState> {
  final GetAssetsUseCase _useCase;

  AssetsCubit(this._useCase) : super(AssetsInitial());

  Future<void> fetchAssets({
    required int page,
    required int pageSize,
    String? search,
  }) async {
    emit(AssetsLoading());
    try {
      final result = await _useCase(
        page: page,
        pageSize: pageSize,
        search: search,
      );
      result.fold((failure) => emit(AssetsFailure(failure.errorMessage)), (
        data,
      ) {
        print("Data asset: ${data.results.length}");
        return emit(AssetsSuccess(data));
      });
    } catch (e) {
      emit(AssetsFailure(e.toString()));
    }
  }
}
