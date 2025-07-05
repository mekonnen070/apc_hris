import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/features/transfer/application/location_data_provider.dart';
import 'package:police_com/features/transfer/presentation/request_transfer_form.dart';

class RequestTransferScreen extends ConsumerWidget {
  const RequestTransferScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationDataAsync = ref.watch(locationDataProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('New Transfer Request'),
      ),
      body: locationDataAsync.when(
        data: (locationData) => RequestTransferForm(locationData: locationData),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Failed to load required data: $err'),
          ),
        ),
      ),
    );
  }
}