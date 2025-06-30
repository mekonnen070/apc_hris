// This is the contract. The blueprint.
// Both the real and mock repositories MUST implement this.
import 'package:police_com/features/auth/domain/auth_state.dart';

abstract class IAuthRepository {
  Future<bool> signUp({
    required String email,
    required String password,
    required String fullName,
    String? address,
    String? phoneNumber,
    DateTime? dateOfBirth,
    String? gender,
    String? maritalStatus,
  });
  Future<bool> login({required String email, required String password});
  Future<void> logout();
  Future<bool> forgotPassword({required String email});
    Future<AuthState> checkAuthState();

}
