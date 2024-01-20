import 'package:animated_emoji/animated_emoji.dart';
import 'package:emotion_tracker/product/constants/color_constants.dart';
import 'package:flutter/material.dart';
import '../../../product/constants/string_constants.dart';

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
  ) // Varsayılan değeri burada belirleyin
  : color = isPositive
            ? ColorConstants.negativeEmotionsColor
            : ColorConstants.positiveEmotionsColor;
}

class MainViewMixin {
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
