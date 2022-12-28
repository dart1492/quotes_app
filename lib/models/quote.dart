class Quote {
  Quote({
    required this.author,
    required this.quoteText,
    required this.rating,
  });
  String? author;
  String? quoteText;
  int? rating;

  Map<String, dynamic> toJson() {
    return {
      'author': author,
      'quoteText': quoteText,
      'rating': rating,
    };
  }

  Quote.fromJson(Map<String, dynamic> jsonMap) {
    author = jsonMap['author'];
    quoteText = jsonMap['quoteText'];
    rating = jsonMap['rating'];
  }
}
