import 'package:emotion_tracker/feauture/qoute_display_page/provider/quate_provider.dart';
import 'package:emotion_tracker/product/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';

final quoteProvider = StateNotifierProvider<QuoteNotifier, QuoteState>((ref) {
  return QuoteNotifier();
});

class QuatePage extends ConsumerStatefulWidget {
  const QuatePage({super.key, required this.emotion});
  final String emotion;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _QuatePageState();
}

class _QuatePageState extends ConsumerState<QuatePage> {
  @override
  void initState() {
    super.initState();
    ref.read(quoteProvider.notifier).getQuote(widget.emotion);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final items = ref.watch(quoteProvider).items;
    return Scaffold(
      appBar: CustomAppBar(
        'Quotes',
        onPressed: () {
          context.route.pop();
        },
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: SizedBox.shrink(),
      ),
      body: ListView.builder(
        itemCount: items?.length ?? 0,
        itemBuilder: (context, index) {
          if (items == null) {
            const CircularProgressIndicator();
          }
          return ListTile(
            title: Text(items?[index].quotes[1].author ?? ''),
            subtitle: Text(items?[index].quotes[1].body ?? ''),
          );
        },
      ),
    );
  }
}
