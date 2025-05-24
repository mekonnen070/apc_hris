import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'registration_notifier.dart';
import 'registration_screen_state.dart';
// TODO: Import and provide your actual API service if needed
// import 'package/your_app/infrastructure/api_service.dart';

// final yourApiServiceProvider = Provider<YourApiService>((ref) => YourApiService());

final registrationNotifierProvider =
    StateNotifierProvider<RegistrationNotifier, RegistrationScreenState>((ref) {
      // final apiService = ref.watch(yourApiServiceProvider);
      // return RegistrationNotifier(apiService);
      return RegistrationNotifier(); // Without API service for now
    });
