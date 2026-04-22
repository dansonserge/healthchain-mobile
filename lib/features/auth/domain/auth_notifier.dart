import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../core/network/api_client.dart';

// State model
class AuthState {
  final bool isAuthenticated;
  final bool isLoading;
  final String? errorMessage;
  final Map<String, dynamic>? userDetails;

  AuthState({
    required this.isAuthenticated,
    required this.isLoading,
    this.errorMessage,
    this.userDetails,
  });

  factory AuthState.initial() => AuthState(
        isAuthenticated: false,
        isLoading: true, // Initially loading while we check local storage
      );

  AuthState copyWith({
    bool? isAuthenticated,
    bool? isLoading,
    String? errorMessage,
    Map<String, dynamic>? userDetails,
  }) {
    return AuthState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage, // We don't coalesce this so it can be cleared
      userDetails: userDetails ?? this.userDetails,
    );
  }
}

// Global Notifier
final authProvider =
    NotifierProvider<AuthNotifier, AuthState>(AuthNotifier.new);

class AuthNotifier extends Notifier<AuthState> {
  Dio get dio => ref.read(dioProvider);
  FlutterSecureStorage get storage => ref.read(secureStorageProvider);

  @override
  AuthState build() {
    // Check session asynchronously after initialization
    Future.microtask(() => _checkExistingSession());
    return AuthState.initial();
  }

  Future<void> _checkExistingSession() async {
    final token = await storage.read(key: 'jwt');
    if (token != null) {
      // Decode user details from local storage
      Map<String, dynamic>? user;
      final userStr = await storage.read(key: 'user_details');
      if (userStr != null) {
        try {
          user = jsonDecode(userStr);
        } catch (_) {}
      }
      
      state = state.copyWith(
        isAuthenticated: true, 
        isLoading: false,
        userDetails: user,
      );
    } else {
      state = state.copyWith(isAuthenticated: false, isLoading: false);
    }
  }

  Future<bool> login(String email, String password) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final response = await dio.post('/users/auth/login', data: {
        'email': email,
        'password': password,
      });

      if (response.statusCode == 200) {
        final token = response.data[
            'token']; // Assumed backend structure based on auth-service implementation
        final user = response.data['user'];

        await storage.write(key: 'jwt', value: token);
        if (user != null) {
          await storage.write(key: 'user_details', value: jsonEncode(user));
        }

        state = state.copyWith(
          isAuthenticated: true,
          isLoading: false,
          userDetails: user,
        );
        return true;
      } else {
        state = state.copyWith(
          isAuthenticated: false,
          isLoading: false,
          errorMessage: 'Invalid credentials. Please try again.',
        );
        return false;
      }
    } on DioException catch (e) {
      String errorMessage =
          'Network authentication failed. Check your connection.';
      if (e.response?.data is Map) {
        errorMessage = e.response?.data?['error'] ?? errorMessage;
      } else if (e.response?.statusMessage != null) {
        errorMessage = e.response!.statusMessage!;
      }

      state = state.copyWith(
        isAuthenticated: false,
        isLoading: false,
        errorMessage: errorMessage,
      );
        return false;
      } catch (e) {
        state = state.copyWith(
          isAuthenticated: false,
          isLoading: false,
          errorMessage: 'An unexpected error occurred.',
        );
        return false;
      }
  }

  Future<void> logout() async {
    await storage.delete(key: 'jwt');
    await storage.delete(key: 'user_details');
    state = state.copyWith(isAuthenticated: false, userDetails: null);
  }
}
