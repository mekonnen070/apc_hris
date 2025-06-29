import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:police_com/core/extensions/context_extension.dart'; // <-- ADDED
import 'package:police_com/features/verification/application/verification_providers.dart';
import 'package:police_com/features/verification/data/verification_repository.dart';
import 'package:police_com/features/verification/presentation/qr_scanner_screen.dart';
import 'package:police_com/features/verification/presentation/widgets/verification_result_widget.dart';
import 'package:toastification/toastification.dart';

class VerificationScreen extends HookConsumerWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController();
    final state = ref.watch(verifyEmployeeProvider);
    final notifier = ref.read(verifyEmployeeProvider.notifier);

    // Use previous state to detect changes
    final previousState = usePrevious(state);

    // Handle error notifications after build
    useEffect(() {
      // Schedule error handling for the next frame to avoid context issues
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (context.mounted && state is AsyncError && previousState != state) {
          final error = state.error;
          final errorMessage = error.toString().replaceFirst('Exception: ', '');

          // Determine error type for appropriate styling
          ToastificationType toastType = ToastificationType.error;
          IconData iconData = Icons.error_outline;

          if (error is VerificationException) {
            // Handle specific error types
            switch (error.type) {
              case VerificationErrorType.invalidFormat:
                toastType = ToastificationType.warning;
                iconData = Icons.format_shapes;
                break;
              case VerificationErrorType.notFound:
                toastType = ToastificationType.error;
                iconData = Icons.person_off;
                break;
              case VerificationErrorType.unauthorized:
                toastType = ToastificationType.warning;
                iconData = Icons.no_accounts;
                break;
              case VerificationErrorType.networkError:
                toastType = ToastificationType.error;
                iconData = Icons.wifi_off;
                break;
              default:
                toastType = ToastificationType.error;
                iconData = Icons.error_outline;
            }
          }

          Toastification toastification = Toastification();

          toastification.dismissAll();

          // Show toast notification for errors
          toastification.show(
            context: context,
            title: Text(context.lango.verificationError), // <-- REPLACED
            description: Text(errorMessage),
            type: toastType,
            style: ToastificationStyle.fillColored,
            autoCloseDuration: const Duration(seconds: 4),
            showProgressBar: true,
            icon: Icon(iconData),
          );
        }
      });

      return null;
    }, [state]);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Search field with QR scanner button
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  labelText: context.lango.enterEmployeeId, // <-- REPLACED
                  hintText: context.lango.employeeIdHint, // <-- REPLACED
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.badge_outlined),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.qr_code_scanner_rounded),
                    tooltip: context.lango.scanQrCode, // <-- REPLACED
                    onPressed: () async {
                      // Show QR scanner and process result
                      final String? qrCode = await Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const QRScannerScreen(),
                        ),
                      );

                      if (qrCode != null && qrCode.isNotEmpty) {
                        searchController.text = qrCode;
                        notifier.searchEmployee(qrCode);

                        // Show scanning success toast
                        toastification.show(
                          context: context,
                          title: Text(context.lango.qrCodeScanned), // <-- REPLACED
                          description: Text(context.lango.searchingForEmployee(qrCode: qrCode)), // <-- REPLACED
                          type: ToastificationType.info,
                          style: ToastificationStyle.minimal,
                          autoCloseDuration: const Duration(seconds: 2),
                          showProgressBar: true,
                          icon: const Icon(Icons.qr_code),
                        );
                      }
                    },
                  ),
                ),
                onSubmitted: (value) {
                  if (value.trim().isNotEmpty) {
                    notifier.searchEmployee(value.trim());
                  }
                },
              ),
            ),

            const SizedBox(height: 24),

            // Main content area showing verification result or prompts
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: state.when(
                data: (employee) {
                  if (employee == null) {
                    return const _InitialStatePrompt();
                  }
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      VerificationResultWidget(employee: employee),
                      const SizedBox(height: 16),
                      FilledButton.icon(
                        onPressed: () {
                          searchController.clear();
                          notifier.clear();
                        },
                        icon: const Icon(Icons.refresh),
                        label: Text(context.lango.verifyNew), // <-- REPLACED
                        style: FilledButton.styleFrom(),
                      ),
                    ],
                  );
                },
                loading:
                    () => Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CircularProgressIndicator(),
                          const SizedBox(height: 16),
                          Text(
                            context.lango.verifyingEmployee, // <-- REPLACED
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                error:
                    (err, stack) => _ErrorState(
                      message: err.toString().replaceFirst('Exception: ', ''),
                      onRetry: () {
                        final query = searchController.text.trim();
                        if (query.isNotEmpty) {
                          notifier.searchEmployee(query);
                        }
                      },
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InitialStatePrompt extends StatelessWidget {
  const _InitialStatePrompt();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.search, size: 80, color: Colors.grey),
          const SizedBox(height: 16),
          Text(
            context.lango.readyToVerify, // <-- REPLACED
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            context.lango.enterIdOrScanQr, // <-- REPLACED
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class _ErrorState extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  const _ErrorState({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 80, color: Colors.redAccent),
          const SizedBox(height: 16),
          Text(
            context.lango.verificationFailed, // <-- REPLACED
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 24),
          ElevatedButton(onPressed: onRetry, child: Text(context.lango.retrySearch)), // <-- REPLACED
        ],
      ),
    );
  }
}