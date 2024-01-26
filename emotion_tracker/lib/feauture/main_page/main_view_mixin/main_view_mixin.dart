import 'package:animated_emoji/animated_emoji.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:emotion_tracker/product/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';
import '../../../product/constants/string_constants.dart';
import '../../history_page/history_page.dart';
import '../main_page.dart';

mixin MainViewMixin on ConsumerState<MainPage> {
  // route to History Page
  void routeHistoryPage(BuildContext context) {
    context.route.navigateToPage(const HistoryPage());
  }

  @override
  void initState() {
    super.initState();
    AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelKey: 'basic_channel',
          channelName: 'Basic Notifications',
          channelDescription: 'Temel Bildirimler',
          defaultColor: const Color(0xFF9D50DD),
          ledColor: Colors.white,
          playSound: true,
          enableVibration: true,
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  // Positive feelings list with animated emoji and color
  final List<EmotionData> emotions = [
    EmotionData(
      StringConstants.alertness,
      const AnimatedEmoji(
        AnimatedEmojis.monocle,
        size: EmotionData.emojiSize,
      ),
      false,
    ),
    EmotionData(
      StringConstants.amusement,
      const AnimatedEmoji(
        AnimatedEmojis.partyingFace,
        size: EmotionData.emojiSize,
      ),
      false,
    ),
    EmotionData(
      StringConstants.awe,
      const AnimatedEmoji(AnimatedEmojis.mouthOpen,
          size: EmotionData.emojiSize),
      false,
    ),
    EmotionData(
      StringConstants.gratitude,
      const AnimatedEmoji(AnimatedEmojis.warmSmile,
          size: EmotionData.emojiSize),
      false,
    ),
    EmotionData(
      StringConstants.hope,
      const AnimatedEmoji(AnimatedEmojis.upsideDownFace,
          size: EmotionData.emojiSize),
      false,
    ),
    EmotionData(
      StringConstants.joy,
      const AnimatedEmoji(
        AnimatedEmojis.zanyFace,
        size: EmotionData.emojiSize,
      ),
      false,
    ),
    EmotionData(
      StringConstants.love,
      const AnimatedEmoji(AnimatedEmojis.heartFace,
          size: EmotionData.emojiSize),
      false,
    ),
    EmotionData(
      StringConstants.pride,
      const AnimatedEmoji(AnimatedEmojis.hugFace, size: EmotionData.emojiSize),
      false,
    ),
    EmotionData(
      StringConstants.satisfaction,
      const AnimatedEmoji(AnimatedEmojis.blush, size: EmotionData.emojiSize),
      false,
    ),

    // Negative feelings list with animated emoji and color

    EmotionData(
      StringConstants.anger,
      const AnimatedEmoji(
        AnimatedEmojis.rage,
        size: EmotionData.emojiSize,
      ),
      true,
    ),
    EmotionData(
      StringConstants.anxiety,
      const AnimatedEmoji(
        AnimatedEmojis.peeking,
        size: EmotionData.emojiSize,
      ),
      true,
    ),
    EmotionData(
      StringConstants.contempt,
      const AnimatedEmoji(
        AnimatedEmojis.concerned,
        size: EmotionData.emojiSize,
      ),
      true,
    ),
    EmotionData(
      StringConstants.disgust,
      const AnimatedEmoji(
        AnimatedEmojis.sick,
        size: EmotionData.emojiSize,
      ),
      true,
    ),

    EmotionData(
      StringConstants.embarrassment,
      const AnimatedEmoji(
        AnimatedEmojis.handOverMouth,
        size: EmotionData.emojiSize,
      ),
      true,
    ),
    EmotionData(
      StringConstants.fear,
      const AnimatedEmoji(
        AnimatedEmojis.screaming,
        size: EmotionData.emojiSize,
      ),
      true,
    ),
    EmotionData(
      StringConstants.quilt,
      const AnimatedEmoji(
        AnimatedEmojis.worried,
        size: EmotionData.emojiSize,
      ),
      true,
    ),
    EmotionData(
      StringConstants.offense,
      const AnimatedEmoji(
        AnimatedEmojis.cursing,
        size: EmotionData.emojiSize,
      ),
      true,
    ),
    EmotionData(
      StringConstants.sadness,
      const AnimatedEmoji(
        AnimatedEmojis.pleading,
        size: EmotionData.emojiSize,
      ),
      true,
    ),
  ];
}

// EmotionData class
class EmotionData {
  final String emotion;
  final AnimatedEmoji animatedEmoji;
  final bool isPositive;
  final Color color;
  static const double emojiSize = 40;

  EmotionData(
    this.emotion,
    this.animatedEmoji,
    this.isPositive,
  ) : color = isPositive
            ? ColorConstants.negativeEmotionsColor
            : ColorConstants.positiveEmotionsColor;
}
