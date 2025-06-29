import 'package:event_pulse/models/auth_response_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repositories/auth_repository.dart';

final authRepositoryProvider = Provider((ref) => AuthRepository());

final authProvider =
    StateNotifierProvider<AuthNotifier, AsyncValue<AuthResponse?>>((ref) {
      final repository = ref.watch(authRepositoryProvider);
      return AuthNotifier(repository);
    });

class AuthNotifier extends StateNotifier<AsyncValue<AuthResponse?>> {
  final AuthRepository _repository;

  AuthNotifier(this._repository) : super(const AsyncValue.data(null));

  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      final result = await _repository.login(email, password);
      state = AsyncValue.data(result);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> register(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      final result = await _repository.register(email, password);
      state = AsyncValue.data(result);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
