import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:event_pulse/models/auth_response_model.dart';

class AuthRepository {
  final String _baseUrl =
      'https://684ed014f0c9c9848d292cdc.mockapi.io/eventpulse/api';

  /// Register User (POST)
  Future<AuthResponse> register(String email, String password) async {
    final uri = Uri.parse('$_baseUrl/users');
    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
        'token': 'mock-token', // Optional, for demo purposes
      }),
    );

    if (response.statusCode == 201) {
      return AuthResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Register failed: ${response.statusCode}');
    }
  }

  /// Login (GET with query params)
  Future<AuthResponse> login(String email, String password) async {
    final uri = Uri.parse('$_baseUrl/users?email=$email&password=$password');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List<dynamic> users = jsonDecode(response.body);
      if (users.isNotEmpty) {
        return AuthResponse.fromJson(users[0]);
      } else {
        throw Exception('Invalid credentials');
      }
    } else {
      throw Exception('Login failed: ${response.statusCode}');
    }
  }
}
