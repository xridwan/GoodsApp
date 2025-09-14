import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecase/location_use_case.dart';
import 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  final LocationUseCase _useCase;

  LocationCubit(this._useCase) : super(LocationInitial());

  Future<void> getLocations() async {
    emit(LocationLoading());
    try {
      final result = await _useCase();
      result.fold(
        (failure) => emit(LocationFailure(failure.toString())),
        (data) => emit(LocationSuccess(data)),
      );
    } catch (e) {
      emit(LocationFailure(e.toString()));
    }
  }
}
