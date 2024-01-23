import 'package:emotion_tracker/feauture/qoute_display_page/mixin/quote_mixin.dart';
import 'package:emotion_tracker/feauture/qoute_display_page/provider/quate_provider.dart';
import 'package:emotion_tracker/product/constants/color_constants.dart';
import 'package:emotion_tracker/product/widgets/custom_app_bar.dart';
import 'package:emotion_tracker/product/widgets/texts/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';
import '../../product/constants/string_constants.dart';

final quoteProvider = StateNotifierProvider<QuoteNotifier, QuoteState>((ref) {
  return QuoteNotifier();
});

class QuatePage extends ConsumerStatefulWidget {
  const QuatePage({super.key, required this.emotion});
  final String emotion;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _QuatePageState();
}

class _QuatePageState extends ConsumerState<QuatePage> with QuoteMixin {
  @override
  Widget build(BuildContext context) {
    final items = ref.watch(quoteProvider).items;
    return Scaffold(
      appBar: CustomAppBar(
        StringConstants.quotes,
        onPressed: () {
          context.route.pop();
        },
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: const SizedBox.shrink(),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(StringConstants.backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: items?.length ?? 0,
          itemBuilder: (context, index) {
            final quates = items![index].quotes[0];

            return Padding(
              padding: context.padding.medium.copyWith(top: 140),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SubtitleText(
                    title: quates.body.toString(),
                    color: ColorConstants.primaryWhite,
                  ),
                  Padding(
                    padding: context.padding.onlyTopNormal,
                    child: TitleText(
                        title: quates.author.toString(),
                        color: ColorConstants.primaryGrey),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
