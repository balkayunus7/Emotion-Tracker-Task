import 'dart:io';
import 'package:dio/dio.dart';
import 'package:emotion_tracker/product/enums/response_strings.dart';
import 'package:emotion_tracker/product/models/quotes.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuoteNotifier extends StateNotifier<QuoteState> {
  QuoteNotifier() : super(const QuoteState());

  final dio = Dio();
  // get random quote from api with emotion
  Future<void> getQuote(String emotion) async {
    dio.options.headers[ResponseEnum.authorization.value] =
        ResponseEnum.token.toAuthorization;
    final response =
        await dio.get(ResponseEnum.getResponseHttp.toFilter(emotion));
    if (response.statusCode == HttpStatus.ok) {
      final datas = response.data;
      // convert to random value
      final List<QuoteElement> quote = Quote.fromJson(datas).quotes;
      quote.shuffle();
      final List<Quote> items = quote
          .map((e) => Quote(
                author: e.author,
                page: null,
                lastPage: null,
                quotes: quote,
                quote: e.body,
              ))
          .toList();
      state = state.copyWith(items: items);
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
