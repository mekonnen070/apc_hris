import 'package:flutter/material.dart';
import 'package:police_com/features/transfer/presentation/request_transfer_screen.dart';
import 'package:police_com/features/transfer/presentation/widgets/my_transfers_list_widget.dart';

class TransferScreen extends StatelessWidget {
  const TransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(child: MyTransfersListWidget()),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const RequestTransferScreen()),
          );
        },
        icon: const Icon(Icons.add),
        label: const Text('Request Transfer'),
      ),
    );
  }
}
