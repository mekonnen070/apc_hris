import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/extensions/context_extension.dart'; // <-- ADDED
import 'package:police_com/features/promotion/application/promotion_providers.dart';
import 'package:police_com/features/promotion/presentation/request_promotion_screen.dart';
import 'package:police_com/features/promotion/presentation/widgets/promotion_list_item_widget.dart';
import 'package:police_com/features/widgets/app_bar_widget.dart';
import 'package:police_com/features/widgets/something_went_wrong_widget.dart';

class PromotionScreen extends ConsumerWidget {
  const PromotionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncRequests = ref.watch(
      myPromotionRequestsProvider('CURRENT_USER_ID'),
    );

    return Scaffold(
      appBar: AppBarWidget(title: context.lango.promotionRequests), // <-- REPLACED & REMOVED CONST
      body: asyncRequests.when(
        data: (requests) {
          if (requests.isEmpty) {
            return Center(child: Text(context.lango.noPromotionRequestsFound)); // <-- REPLACED & REMOVED CONST
          }
          return RefreshIndicator(
            onRefresh:
                () => ref.refresh(
                  myPromotionRequestsProvider('CURRENT_USER_ID').future,
                ),
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: requests.length,
              itemBuilder: (context, index) {
                return PromotionListItemWidget(request: requests[index]);
              },
            ),
          );
        },
        error:
            (err, stack) => SomethingWentWrongWidget(
              onRetry: () => ref.invalidate(myPromotionRequestsProvider),
            ),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.of(context).push<bool?>(
            MaterialPageRoute(
              builder: (context) => const RequestPromotionScreen(),
            ),
          );
          if (result == true) {
            ref.invalidate(myPromotionRequestsProvider);
          }
        },
        tooltip: context.lango.requestPromotion, // <-- REPLACED
        child: const Icon(Icons.trending_up),
      ),
    );
  }
}