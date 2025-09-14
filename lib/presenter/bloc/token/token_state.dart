abstract class TokenState {}

class TokenInitial extends TokenState {}

class TokenLoading extends TokenState {}

class TokenLoaded extends TokenState {
  final String token;

  TokenLoaded(this.token);
}

class TokenEmpty extends TokenState {}

class TokenError extends TokenState {
  final String message;

  TokenError(this.message);
}