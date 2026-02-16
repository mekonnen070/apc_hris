import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/config/server_config/server_config.dart';
import 'package:police_com/core/config/server_config/server_config_notifier.dart';
import 'package:police_com/core/extensions/context_extension.dart';
import 'package:police_com/core/navigation/app_orchestrator.dart';
import 'package:police_com/features/widgets/language_switcher_widget.dart';
import 'package:police_com/features/widgets/theme_switcher_widget.dart';

class ServerSetupScreen extends ConsumerStatefulWidget {
  /// If true, this screen was pushed for editing (e.g., from settings or
  /// a recovery screen), so it should show a back button and pop on success.
  /// If false, this is the initial setup, and it should replace the navigation
  /// stack on success.
  final bool isFromSettings;

  const ServerSetupScreen({super.key, this.isFromSettings = false});

  @override
  ConsumerState<ServerSetupScreen> createState() => _ServerSetupScreenState();
}

class _ServerSetupScreenState extends ConsumerState<ServerSetupScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _ipController;
  late final TextEditingController _portController;

  @override
  void initState() {
    super.initState();
    // Pre-fill the fields with existing data if it exists.
    final initialConfig = ref.read(serverConfigProvider).valueOrNull;
    _ipController = TextEditingController(text: initialConfig?.ip ?? '196.190.116.240');
    _portController = TextEditingController(
      text: initialConfig?.port.toString() ?? '8181',
    );
  }

  @override
  void dispose() {
    _ipController.dispose();
    _portController.dispose();
    super.dispose();
  }

  /// Translates an error key from the notifier into a user-friendly, localized string.
  String _translateError(BuildContext context, Object errorKey) {
    final l10n = context.lango;
    switch (errorKey.toString()) {
      case 'errorServerUnreachable':
        return l10n.errorServerUnreachable;
      case 'errorConnectionTimeout':
        return l10n.errorConnectionTimeout;
      case 'errorUnexpectedResponse':
        return l10n.errorUnexpectedResponse;
      case 'errorGeneric':
        return l10n.errorGeneric;
      default:
        return errorKey.toString();
    }
  }

  /// Validates the form and triggers the connection test and save logic.
  Future<void> _saveAndConnect() async {
    FocusManager.instance.primaryFocus?.unfocus();

    if (_formKey.currentState!.validate()) {
      final config = ServerConfig(
        ip: _ipController.text.trim(),
        port: int.parse(_portController.text.trim()),
      );
      await ref.read(serverConfigProvider.notifier).setConfig(config);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Listen for a successful connection to handle navigation.
    ref.listen<AsyncValue<ServerConfig?>>(serverConfigProvider, (_, next) {
      next.whenData((config) {
        if (config != null) {
          if (widget.isFromSettings) {
            // If we came here to edit, just pop the screen on success.
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            }
          } else {
            // Otherwise, it's the initial setup, so go to the main app flow.
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const AppOrchestrator()),
            );
          }
        }
      });
    });

    final serverConfigState = ref.watch(serverConfigProvider);

    return PopScope(
      canPop: widget.isFromSettings,
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.lango.serverConfiguration),
          automaticallyImplyLeading: widget.isFromSettings,
          actions: [
            LanguageSwitcherWidget(
              iconColor:
                  Theme.of(context).textTheme.bodyLarge?.color ?? Colors.white,
            ),
            const ThemeSwitcherWidget(),
          ],
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Icon(Icons.dns_outlined, size: 80, color: Colors.grey),
                  const SizedBox(height: 20),
                  Text(
                    context.lango.connectToServer,
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: _ipController,
                    decoration: InputDecoration(
                      labelText: context.lango.serverIpAddress,
                      hintText: context.lango.serverIpAddressHint,
                      border: const OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.url,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return context.lango.errorEnterIp;
                      }
                      final ipRegex = RegExp(
                        r'^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$',
                      );
                      if (!ipRegex.hasMatch(value.trim())) {
                        return context.lango.errorInvalidIp;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _portController,
                    decoration: InputDecoration(
                      labelText: context.lango.port,
                      hintText: context.lango.portHint,
                      border: const OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return context.lango.errorEnterPort;
                      }
                      final port = int.tryParse(value.trim());
                      if (port == null || port < 1 || port > 65535) {
                        return context.lango.errorInvalidPort;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  if (serverConfigState.hasError &&
                      !serverConfigState.isLoading)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Text(
                        _translateError(context, serverConfigState.error!),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                    ),
                  SizedBox(
                    height: 50,
                    child:
                        serverConfigState.isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : ElevatedButton(
                              onPressed: _saveAndConnect,
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                                textStyle:
                                    Theme.of(context).textTheme.titleMedium,
                              ),
                              child: Text(context.lango.saveAndConnect),
                            ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
