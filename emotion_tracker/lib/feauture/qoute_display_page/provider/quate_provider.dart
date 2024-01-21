import 'dart:io';

import 'package:dio/dio.dart';
import 'package:emotion_tracker/product/models/quotes.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuoteNotifier extends StateNotifier<QuoteState> {
  QuoteNotifier() : super(const QuoteState());
  final dio = Dio();

  Future<void> getQuote(String emotion) async {
    dio.options.headers['Authorization'] =
        'Token token="7292aee71e6070a54a56d15a01257019"';
    final response =
        await dio.get('https://favqs.com/api/quotes/?filter=$emotion');
    if (response.statusCode == HttpStatus.ok) {
      final datas = response.data;

      final List<QuoteElement> quoteElements =
          (datas['quotes'] as List<dynamic>)
              .map((quoteData) => QuoteElement.fromJson(quoteData))
              .toList();

      final Quote quote = Quote(
        page: datas['page'],
        lastPage: datas['last_page'],
        quotes: quoteElements,
      );

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
