class Quote {
  Quote({
    required this.author,
    required this.quoteText,
    required this.rating,
  });
  String? author;
  String? quoteText;
  String? uniqueID;
  int? rating;

  Map<String, dynamic> toJson() {
    return {
      'author': author,
      'quoteText': quoteText,
      'rating': rating,
      'uniqueID': uniqueID,
    };
  }

  Quote.fromJson(Map<String, dynamic> jsonMap) {
    author = jsonMap['author'];
    quoteText = jsonMap['quoteText'];
    rating = jsonMap['rating'];
    uniqueID = jsonMap['uniqueID'];
  }

  @override
  String toString() {
    return "Author: $author\nQuoteText: $quoteText\nRating: $rating\n ID: $uniqueID";
  }
}
