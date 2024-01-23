class Quote {
  Quote({
    required this.page,
    required this.lastPage,
    required this.quotes,
  });

  final int? page;
  final bool? lastPage;
  final List<QuoteElement> quotes;

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      page: json["page"],
      lastPage: json["last_page"],
      quotes: json["quotes"] == null
          ? []
          : List<QuoteElement>.from(
              json["quotes"]!.map((x) => QuoteElement.fromJson(x))),
    );
  }
}

class QuoteElement {
  QuoteElement({
    required this.id,
    required this.dialogue,
    required this.private,
    required this.tags,
    required this.url,
    required this.favoritesCount,
    required this.upvotesCount,
    required this.downvotesCount,
    required this.author,
    required this.authorPermalink,
    required this.body,
  });

  final int? id;
  final bool? dialogue;
  final bool? private;
  final List<String> tags;
  final String? url;
  final int? favoritesCount;
  final int? upvotesCount;
  final int? downvotesCount;
  final String? author;
  final String? authorPermalink;
  late final String? body;

  factory QuoteElement.fromJson(Map<String, dynamic> json) {
    return QuoteElement(
      id: json["id"],
      dialogue: json["dialogue"],
      private: json["private"],
      tags: json["tags"] == null
          ? []
          : List<String>.from(json["tags"]!.map((x) => x)),
      url: json["url"],
      favoritesCount: json["favorites_count"],
      upvotesCount: json["upvotes_count"],
      downvotesCount: json["downvotes_count"],
      author: json["author"],
      authorPermalink: json["author_permalink"],
      body: json["body"],
    );
  }
}
