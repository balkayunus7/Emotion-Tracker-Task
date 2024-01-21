// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainNotifier extends StateNotifier<MainState> {
  MainNotifier() : super(const MainState());

  static const String selectedEmotionsKey = 'selectedEmotions';
}

class MainState extends Equatable {
  const MainState({
    this.isSelected,
  });

  final bool? isSelected;

  @override
  List<Object?> get props => [isSelected];

  MainState copyWith({
    bool? isSelected,
  }) {
    return MainState(
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
