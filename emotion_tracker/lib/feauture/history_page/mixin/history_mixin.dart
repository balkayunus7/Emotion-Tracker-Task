import 'package:emotion_tracker/feauture/history_page/history_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

mixin HistoryMixin on ConsumerState<HistoryPage> {
  Future<void> getSelectedHistory() async {
    ref.read(historyProvider.notifier).getSelectedHistory();
  }

  String convertToDateTime(String timeString) {
    timeString =
        DateFormat('dd/MM/yyyy HH:mm').format(DateTime.parse(timeString));
    return timeString;
  }
  List<String> splitEmotionInfo(String emotionInfo) {
    List<String> emotionInfoParts = emotionInfo.split(' - ');
    return emotionInfoParts;
  }
}
