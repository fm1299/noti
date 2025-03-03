import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/auth_service.dart';
import '../data/auth_local_storage.dart';

class AuthNotifier extends StateNotifier<bool> {
  final AuthService _authService;
  final AuthLocalStorage _authLocalStorage;

  AuthNotifier(this._authService, this._authLocalStorage) : super(false);

  Future<void> login(String email, String password) async {
    try {
      final response = await _authService.login(email, password);
      await _authLocalStorage.saveToken(response['token']);
      state = true;
    } catch (e) {
      state = false;
    }
  }

  Future<void> logout() async {
    await _authLocalStorage.removeToken();
    state = false;
  }

  void register(String text, String text2, String text3) {}
}

final authProvider = StateNotifierProvider<AuthNotifier, bool>((ref) {
  return AuthNotifier(AuthService(), AuthLocalStorage());
});
