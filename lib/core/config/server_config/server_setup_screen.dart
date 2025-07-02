import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/config/server_config/server_config.dart';
import 'package:police_com/core/config/server_config/server_config_notifier.dart';
import 'package:police_com/core/extensions/context_extension.dart';
import 'package:police_com/core/navigation/app_orchestrator.dart'; // Import the orchestrator

class ServerSetupScreen extends ConsumerStatefulWidget {
  /// A flag to determine if this screen was pushed for editing/recovery.
  /// If true, it will show a back button in the AppBar.
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
    final initialConfig = ref.read(serverConfigProvider).valueOrNull;
    _ipController = TextEditingController(text: initialConfig?.ip ?? '');
    _portController = TextEditingController(
      text: initialConfig?.port.toString() ?? '',
    );
  }

  @override
  void dispose() {
    _ipController.dispose();
    _portController.dispose();
    super.dispose();
  }

  void _saveAndConnect() {
    FocusManager.instance.primaryFocus?.unfocus();
    if (_formKey.currentState!.validate()) {
      final config = ServerConfig(
        ip: _ipController.text.trim(),
        port: int.parse(_portController.text.trim()),
      );
      ref.read(serverConfigProvider.notifier).setConfig(config);
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<ServerConfig?>>(serverConfigProvider, (_, next) {
      next.whenData((config) {
        if (config != null) {
          // If setup is successful, decide where to navigate.
          if (widget.isFromSettings) {
            // If we came from settings, just pop back.
            Navigator.of(context).pop();
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
                  const Icon(Icons.dns_outlined, size: 80),
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
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
                        'Error: ${serverConfigState.error}',
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
