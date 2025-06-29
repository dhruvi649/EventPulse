class AuthResponse {
  final String id;
  final String email;
  final String? token;

  AuthResponse({required this.id, required this.email, this.token});

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      id: json['id'].toString(),
      email: json['email'],
      token: json['token'],
    );
  }
}
