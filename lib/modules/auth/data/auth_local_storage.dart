import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthLocalStorage {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<void> saveToken(String token) async {
    await storage.write(key: 'auth_token', value: token);
  }

  Future<String?> getToken() async {
    return await storage.read(key: 'auth_token');
  }

  Future<void> removeToken() async {
    await storage.delete(key: 'auth_token');
  }
}
