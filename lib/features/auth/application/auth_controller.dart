import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/l10n/language_controller.dart';
import 'package:police_com/features/auth/data/auth_repository.dart';

final authControllerProvider = Provider<AuthController>((ref) {
  return AuthController(ref);
});

final isLoggedInProvider = StateProvider<bool>((ref) => false);

class AuthController {
  final Ref ref;

  AuthController(this.ref);

  Future<void> signUp({
    required String email,
    required String password,
    required String fullName,
    String? address,
    String? phoneNumber,
    DateTime? dateOfBirth,
    String? gender,
    String? maritalStatus,
  }) async {
    await ref
        .read(auhtRepositoryProvider)
        .signUp(email: email, password: password, fullName: fullName);
  }

  Future<void> login({required String email, required String password}) async {
    await ref
        .read(auhtRepositoryProvider)
        .login(email: email, password: password);

    await ref.read(userControllerProvider.notifier).updateUserLoginStatus(true);
  }

  Future<void> forgotPassword({required String email}) async {
    await ref.read(auhtRepositoryProvider).forgotPassword(email: email);
  }

  Future<void> logout() async {
    // ref.read(isLoggedInProvider.notifier).state = false;
    await ref
        .read(userControllerProvider.notifier)
        .updateUserLoginStatus(false);
    // await ref.read(auhtRepositoryProvider).logout();
  }
}
