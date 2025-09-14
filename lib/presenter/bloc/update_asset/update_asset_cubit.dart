import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goods_app/presenter/bloc/update_asset/update_asset_state.dart';

import '../../../domain/usecase/asset_use_case.dart';

class UpdateAssetCubit extends Cubit<UpdateAssetState> {
  final UpdateAssetUseCase useCase;

  UpdateAssetCubit(this.useCase) : super(UpdateAssetInitial());

  Future<void> updateAsset(
    String id,
    String name,
    String statusId,
    String locationId,
  ) async {
    emit(UpdateAssetLoading());
    final result = await useCase(id, name, statusId, locationId);
    result.fold(
      (failure) => emit(UpdateAssetFailure(failure.toString())),
      (data) => emit(UpdateAssetSuccess(data)),
    );
  }
}
