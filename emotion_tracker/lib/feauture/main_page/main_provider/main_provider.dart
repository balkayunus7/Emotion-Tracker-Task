import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainNotifier extends StateNotifier<MainState> {
  MainNotifier() : super(const MainState());

  void changeHistoryState() {
    state = MainState(isShowHistory: !state.isShowHistory);
  }

  static const String selectedScreenKey = 'selectedScreen';
  static const String selectedTimeKey = 'selectedTime';

  Future<void> saveSelectedScreen(String screenName, DateTime time) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(selectedScreenKey, screenName);
    prefs.setString(selectedTimeKey, time.toIso8601String());
  }

  Future<String?> getSelectedScreen() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(selectedScreenKey);
  }

  Future<DateTime?> getSelectedTime() async {
    final prefs = await SharedPreferences.getInstance();
    final isoString = prefs.getString(selectedTimeKey);
    return isoString != null ? DateTime.parse(isoString) : null;
  }
}

class MainState extends Equatable {
  const MainState({
    this.isShowHistory = false,
  });

  final bool isShowHistory;

  @override
  List<Object?> get props => [isShowHistory];
}
