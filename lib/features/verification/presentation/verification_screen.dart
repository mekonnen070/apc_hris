import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:police_com/core/config/server_config/server_config_notifier.dart';
import 'package:police_com/core/extensions/context_extension.dart';
import 'package:police_com/features/verification/application/verification_providers.dart';
import 'package:police_com/features/verification/presentation/qr_scanner_screen.dart';
import 'package:police_com/features/verification/presentation/widgets/verification_result_widget.dart';
import 'package:toastification/toastification.dart';

class VerificationScreen extends HookConsumerWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(body: SafeArea(child: VerificationBody()));
  }
}

class VerificationBody extends HookConsumerWidget {
  const VerificationBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController();
    final verificationState = ref.watch(verifyEmployeeProvider);
    final notifier = ref.read(verifyEmployeeProvider.notifier);
    final serverConfig = ref.watch(serverConfigProvider).valueOrNull;
    final baseUrl =
        serverConfig != null
            ? 'https://${serverConfig.ip}:${serverConfig.port}'
            : '';
    final previousState = usePrevious(verificationState);

    // useEffect to handle showing toast notifications for errors
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (context.mounted &&
            verificationState is AsyncError &&
            previousState != verificationState) {
          final errorMessage = context.lango.verificationErrorNotFound;

          toastification.dismissAll();
          toastification.show(
            context: context,
            title: Text(context.lango.verificationError),
            description: Text(errorMessage),
            type: ToastificationType.error,
            style: ToastificationStyle.fillColored,
            autoCloseDuration: const Duration(seconds: 5),
            showProgressBar: true,
            icon: const Icon(Icons.error_outline),
          );
        }
      });
      return null;
    }, [verificationState]);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  labelText: context.lango.enterEmployeeId,
                  hintText: context.lango.employeeIdHint,
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.badge_outlined),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.qr_code_scanner_rounded),
                    tooltip: context.lango.scanQrCode,
                    onPressed: () async {
                      final String? qrCode = await Navigator.of(
                        context,
                      ).push(
                        MaterialPageRoute(
                          builder: (context) => const QRScannerScreen(),
                        ),
                      );
                      if (qrCode != null && qrCode.isNotEmpty) {
                        String? employeeId;
                        try {
                          final decoded = jsonDecode(qrCode);
                          if (decoded is Map<String, dynamic> &&
                              decoded.containsKey('መለያ')) {
                            employeeId = decoded['መለያ'] as String?;
                          }
                        } catch (_) {
                          // Not valid JSON — treat as plain employee ID.
                          employeeId = qrCode;
                        }

                        if (employeeId != null &&
                            employeeId.trim().isNotEmpty &&
                            employeeId.length <= 100) {
                          searchController.text = employeeId;
                          notifier.searchEmployee(employeeId);
                        } else if (context.mounted) {
                          toastification.show(
                            context: context,
                            title: Text(context.lango.verificationError),
                            description: Text(
                              context.lango.verificationErrorNotFound,
                            ),
                            type: ToastificationType.error,
                            style: ToastificationStyle.fillColored,
                            autoCloseDuration: const Duration(seconds: 5),
                            showProgressBar: true,
                            icon: const Icon(Icons.error_outline),
                          );
                        }
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
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: verificationState.when(
                data: (employee) {
                  if (employee == null) {
                    return const _InitialStatePrompt();
                  }
                  return Column(
                    children: [
                      VerificationResultWidget(
                        employee: employee,
                        baseUrl: baseUrl,
                      ),
                      const SizedBox(height: 16),
                      FilledButton.icon(
                        onPressed: () {
                          searchController.clear();
                          notifier.clear();
                        },
                        icon: const Icon(Icons.refresh),
                        label: Text(context.lango.verifyNew),
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
                            context.lango.verifyingEmployee,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                error:
                    (err, stack) => _ErrorState(
                      message: context.lango.verificationErrorNotFound,
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
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.search, size: 80, color: Colors.grey),
            const SizedBox(height: 16),
            Text(
              context.lango.readyToVerify,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              context.lango.enterIdOrScanQr,
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: Colors.grey[600]),
            ),
          ],
        ),
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
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 80,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 16),
            Text(
              context.lango.verificationFailed,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: Colors.grey[600]),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: onRetry,
              child: Text(context.lango.retrySearch),
            ),
          ],
        ),
      ),
    );
  }
}
