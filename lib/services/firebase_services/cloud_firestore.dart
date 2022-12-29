import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quotes_app/models/quote.dart';

class CloudFirestore {
  final _quotesCollection = FirebaseFirestore.instance.collection('quotes');

  // Stream<QuerySnapshot<Map<String, dynamic>>> getQuotesDocuments() async* {
  //   yield* _quotesCollection.snapshots();
  // }

  Future<QuerySnapshot<Map<String, dynamic>>> getQuotesDocuments() async {
    return _quotesCollection.get();
  }

  Future addQuote(Map<String, dynamic> quoteJsonParsed) async {
    var newDocID = _quotesCollection.doc().id;
    quoteJsonParsed['uniqueID'] = newDocID;
    await _quotesCollection.doc(newDocID).set(quoteJsonParsed);
  }

  Stream<List<Quote>> getQuotesStream() {
    return _quotesCollection
        .orderBy('rating', descending: true)
        .snapshots()
        .map(
      (event) {
        List<Quote> result = [];
        for (var element in event.docs) {
          result.add(Quote.fromJson(element.data()));
        }
        return result;
      },
    );
  }

  Future<void> likeQuote(String uniqueID, bool isLiked) async {
    if (isLiked) {
      await _quotesCollection
          .doc(uniqueID)
          .update({"rating": FieldValue.increment(1)});
    } else {
      await _quotesCollection
          .doc(uniqueID)
          .update({"rating": FieldValue.increment(-1)});
    }
  }
}
