import 'package:emotion_tracker/feauture/history_page/history_page.dart';
import 'package:emotion_tracker/feauture/main_page/main_view_mixin/main_view_mixin.dart';
import 'package:emotion_tracker/product/constants/color_constants.dart';
import 'package:emotion_tracker/product/constants/string_constants.dart';
import 'package:emotion_tracker/product/widgets/custom_app_bar.dart';
import 'package:emotion_tracker/product/widgets/show_button.dart';
import 'package:emotion_tracker/product/widgets/texts/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';
import '../../product/enums/widget_sizes.dart';
import '../../product/widgets/texts/button_text.dart';
import '../qoute_display_page/quate_page.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> with MainViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          StringConstants.appName,
          onPressed: () {},
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: const SizedBox.shrink(),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: context.padding.horizontalNormal,
              child: const TitleText(
                  title: StringConstants.mainTitle,
                  color: ColorConstants.textTitleColor),
            ),
            Expanded(
              child: Padding(
                  padding: context.padding.normal,
                  child: _GridViewHome(emotions: emotions)),
            ),
            Padding(
              padding: context.padding.onlyBottomNormal,
              child: ShowButton(
                  text: StringConstants.showHistory,
                  onPressed: () => routeHistoryPage(context)),
            )
          ],
        ));
  }
}

class _GridViewHome extends ConsumerWidget {
  const _GridViewHome({
    required this.emotions,
  });

  final List<EmotionData> emotions;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 15,
          childAspectRatio: 1.4,
          mainAxisSpacing: 27,
          crossAxisCount: 3),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            context.route
                .navigateToPage(QuatePage(
                  emotion: emotions[index].emotion,
                ))
                .then((value) => ref
                  ..read(historyProvider.notifier).addEmotionHistory(
                      emotions[index].emotion, DateTime.now()));
          },
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      emotions[index].color.withOpacity(0.3),
                      emotions[index].color.withOpacity(1),
                    ]),
                color: emotions[index].color,
                borderRadius: WidgetSizeConstants.borderRadiusNormal),
            child: Column(
              children: [
                Padding(
                  padding: context.padding.low,
                  child: emotions[index].animatedEmoji,
                ),
                ButtonText(
                  emotions[index].emotion,
                  text: emotions[index].emotion,
                ),
              ],
            ),
          ),
        );
      },
      itemCount: emotions.length,
    );
  }
}
