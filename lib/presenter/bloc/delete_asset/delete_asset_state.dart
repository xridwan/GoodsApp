abstract class DeleteAssetState {}

class DeleteAssetInitial extends DeleteAssetState {}

class DeleteAssetLoading extends DeleteAssetState {}

class DeleteAssetSuccess extends DeleteAssetState {
  final String message;

  DeleteAssetSuccess(this.message);
}

class DeleteAssetFailure extends DeleteAssetState {
  final String message;

  DeleteAssetFailure(this.message);
}