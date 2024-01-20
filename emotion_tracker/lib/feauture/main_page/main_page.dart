import 'package:emotion_tracker/feauture/main_page/history_page.dart';
import 'package:emotion_tracker/feauture/main_page/main_provider/main_provider.dart';
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

// * State notifier provider created to be used in the profile page
final mainProvider = StateNotifierProvider<MainNotifier, MainState>((ref) {
  return MainNotifier();
});

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  MainViewMixin mainViewMixin = MainViewMixin();
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
              child: _MainGridview(mainViewMixin: mainViewMixin),
            )),
            Padding(
              padding: context.padding.onlyBottomNormal,
              child: ShowButton(
                  text: StringConstants.showHistory, onPressed: () {
                    context.route.navigateToPage(HistoryPage());
                  }),
            )
          ],
        ));
  }
}

class _MainGridview extends ConsumerWidget {
  const _MainGridview({
    required this.mainViewMixin,
  });

  final MainViewMixin mainViewMixin;

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
              ref.read(mainProvider.notifier).saveSelectedScreen(
                  mainViewMixin.emotions[index].emotion, DateTime.now());
            },
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        mainViewMixin.emotions[index].color.withOpacity(0.3),
                        mainViewMixin.emotions[index].color.withOpacity(1),
                      ]),
                  color: mainViewMixin.emotions[index].color,
                  borderRadius: WidgetSizeConstants.borderRadiusNormal),
              child: Column(
                children: [
                  Padding(
                    padding: context.padding.low,
                    child: mainViewMixin.emotions[index].animatedEmoji,
                  ),
                  ButtonText(
                    text: mainViewMixin.emotions[index].emotion,
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: mainViewMixin.emotions.length);
  }
}
