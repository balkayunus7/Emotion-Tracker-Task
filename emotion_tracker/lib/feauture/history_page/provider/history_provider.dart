// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryProvider extends StateNotifier<HistoryState> {
  HistoryProvider() : super(const HistoryState());

  static const String selectedEmotionsKey = 'selectedEmotions';

  // Add emotion to history to local database with SharedPreferences
  Future<void> addEmotionHistory(String emotion, DateTime selectedTime) async {
    final prefs = await SharedPreferences.getInstance();
    final lastTimestamp = prefs.getInt('lastEmotionTimestamp') ?? 0;

    if (DateTime.now()
            .difference(DateTime.fromMillisecondsSinceEpoch(lastTimestamp)) >=
        const Duration(minutes: 5)) {
      state = state.copyWith(isSelected: false);
      // Update the timestamp
      await prefs.setInt(
          'lastEmotionTimestamp', DateTime.now().millisecondsSinceEpoch);

      // Continue with the rest of your logic
      List<String> historyList = prefs.getStringList(selectedEmotionsKey) ?? [];
      String historyItem = '$emotion - ${selectedTime.toIso8601String()}';
      historyList.add(historyItem);
      prefs.setStringList(selectedEmotionsKey, historyList);
    } else {
      state = state.copyWith(isSelected: true);
    }
  }

  // Get selected emotions from local database with SharedPreferences
  Future<List<String>> getSelectedHistory() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> historyList = prefs.getStringList(selectedEmotionsKey) ?? [];
    return historyList;
  }
}

// History State
class HistoryState extends Equatable {
  const HistoryState({
    this.isSelected = false,
  });

  final bool? isSelected;

  @override
  List<Object?> get props => [isSelected];

  HistoryState copyWith({
    bool? isSelected,
  }) {
    return HistoryState(
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
