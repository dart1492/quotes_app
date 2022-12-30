import 'package:flutter_test/flutter_test.dart';
import 'package:quotes_app/models/quote.dart';

void main() {
  test(
      'Given Quote with author: dart, quoteText: dont be  afraid, rating: 0 (int), uniqueID: "1", When toJson is called Then Map<String, dynamic> is returned ',
      () {
    // ARRANGE
    Quote givenQuote =
        Quote(author: "dart", quoteText: "dont be afraid", rating: 0);

    givenQuote.uniqueID = "1";

    var expectedMap = {
      'author': 'dart',
      'quoteText': 'dont be afraid',
      'rating': 0,
      'uniqueID': '1',
    };
    // ACT
    var result = givenQuote.toJson();

    // ASSERT

    expect(result, expectedMap);
  });

  test(
      'Given Map with author: dart, quoteText: dont be  afraid, rating: 0 (int), uniqueID: "1", When Quote.fromJson is called then Quote object with same values is returned ',
      () {
    // ARRANGE
    Quote givenQuote =
        Quote(author: "dart", quoteText: "dont be afraid", rating: 0);

    givenQuote.uniqueID = "1";

    Quote newGivenQuote =
        Quote(author: "dart", quoteText: "dont be afraid", rating: 0);

    newGivenQuote.uniqueID = "1";

    var givenMap = {
      'author': 'dart',
      'quoteText': 'dont be afraid',
      'rating': 0,
      'uniqueID': '1',
    };
    // ACT
    Quote resultingQuote = Quote.fromJson(givenMap);

    // ASSERT

    expect(givenQuote.toString(), resultingQuote.toString());
  });
}
