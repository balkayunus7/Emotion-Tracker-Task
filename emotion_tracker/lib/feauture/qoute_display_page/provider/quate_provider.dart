import 'dart:io';

import 'package:dio/dio.dart';
import 'package:emotion_tracker/product/enums/response_strings.dart';
import 'package:emotion_tracker/product/models/quotes.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuoteNotifier extends StateNotifier<QuoteState> {
  QuoteNotifier() : super(const QuoteState());
  final dio = Dio();

  Future<void> getQuote(String emotion) async {
    dio.options.headers[ResponseEnum.authorization.value] =
        ResponseEnum.token.toAuthorization;
    final response =
        await dio.get(ResponseEnum.getResponseHttp.toFilter(emotion));
    if (response.statusCode == HttpStatus.ok) {
      final datas = response.data;

      final Quote quote = Quote.fromJson(datas);
      state = state.copyWith(items: [quote]);
    }
  }
}

class QuoteState extends Equatable {
  const QuoteState({this.items});
  final List<Quote>? items;
  @override
  List<Object?> get props => [items];

  QuoteState copyWith({
    List<Quote>? items,
  }) {
    return QuoteState(
      items: items ?? this.items,
    );
  }
}
