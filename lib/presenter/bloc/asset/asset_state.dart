import 'package:equatable/equatable.dart';

import '../../../data/response/asset_list_response.dart';

abstract class AssetsState extends Equatable {
  const AssetsState();

  @override
  List<Object> get props => [];
}

class AssetsInitial extends AssetsState {}

class AssetsLoading extends AssetsState {}

class AssetsSuccess extends AssetsState {
  final AssetListResponse response;

  const AssetsSuccess(this.response);

  @override
  List<Object> get props => [response];
}

class AssetsFailure extends AssetsState {
  final String message;

  const AssetsFailure(this.message);

  @override
  List<Object> get props => [message];
}
