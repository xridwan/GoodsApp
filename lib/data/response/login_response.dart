class LoginResponse {
  final String? id;
  final String? email;
  final String? username;
  final bool? isActive;
  final String? token;

  LoginResponse({
    this.id,
    this.email,
    this.username,
    this.isActive,
    this.token,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      id: json['id'] as String?,
      email: json['email'] as String?,
      username: json['username'] as String?,
      isActive: json['is_active'] as bool?,
      token: json['token'] as String?,
    );
  }
}

