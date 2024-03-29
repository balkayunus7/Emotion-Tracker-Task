import 'dart:async';
import 'package:awesome_notifications/awesome_notifications.dart';
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
                  color: ColorConstants.primaryWhite),
            ),
            Expanded(
              child: Padding(
                  padding: context.padding.normal,
                  child: _GridViewHome(
                    emotions: emotions,
                  )),
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

class _GridViewHome extends ConsumerStatefulWidget {
  const _GridViewHome({required this.emotions});
  final List<EmotionData> emotions;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => __GridViewHomeState();
}

class __GridViewHomeState extends ConsumerState<_GridViewHome> {
  bool isCooldown = false;

  void changeCooldown() {
    setState(() {
      isCooldown = !isCooldown;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: WidgetSize.crossAxisSpacing.value,
          childAspectRatio: WidgetSize.childAspectRatio.value,
          mainAxisSpacing: WidgetSize.mainAxisSpacing.value,
          crossAxisCount: WidgetSize.crossAxisCount.value.toInt()),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            if (!isCooldown) {
              showDialog(
                  context: context,
                  builder: (context) => const AlertDialog(
                        content: Text(StringConstants.waitMessage),
                      ));
              setState(() {
                changeCooldown();
              });
              // Wait to tap gridview 5 minutes
              Timer(const Duration(minutes: 5), () {
                setState(() {
                  changeCooldown();
                });
              });
              context.route
                  .navigateToPage(QuatePage(
                    emotion: widget.emotions[index].emotion,
                  ))
                  .then((value) => ref
                    ..read(historyProvider.notifier).addEmotionHistory(
                        widget.emotions[index].emotion, DateTime.now()))
                  .then((value) => timerNotifiction());
            }
          },
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      widget.emotions[index].color.withOpacity(0.3),
                      widget.emotions[index].color.withOpacity(1),
                    ]),
                color: widget.emotions[index].color,
                borderRadius: WidgetSizeConstants.borderRadiusNormal),
            child: Column(
              children: [
                Padding(
                  padding: context.padding.low,
                  child: widget.emotions[index].animatedEmoji,
                ),
                ButtonText(
                  widget.emotions[index].emotion,
                  text: widget.emotions[index].emotion,
                ),
              ],
            ),
          ),
        );
      },
      itemCount: widget.emotions.length,
    );
  }

  Timer timerNotifiction() {
    return Timer.periodic(const Duration(minutes: 5), (timer) {
      List<NotificationActionButton> actionButtons = [];
      for (int index = 0; index < widget.emotions.length; index++) {
        actionButtons.add(
          NotificationActionButton(
            key: widget.emotions[index].emotion,
            label: widget.emotions[index].emotion,
            enabled: true,
            icon: StringConstants.notificationIcon,
          ),
        );
      }
      AwesomeNotifications()
          .createNotification(
            content: NotificationContent(
              color: ColorConstants.negativeEmotionsColor,
              id: 10,
              channelKey: StringConstants.notificationChannelName,
              body: StringConstants.notificationBody,
              title: StringConstants.notificationTitle,
            ),
            actionButtons: actionButtons,
          )
          .then((value) => AwesomeNotifications().setListeners(
                  onActionReceivedMethod: (receivedNotification) {
                return context.route.navigateToPage(QuatePage(
                  emotion: receivedNotification.buttonKeyPressed,
                ));
              }));
    });
  }
}
