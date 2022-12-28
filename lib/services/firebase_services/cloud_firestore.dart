import 'package:cloud_firestore/cloud_firestore.dart';

class CloudFirestore {
  final _quotesCollection = FirebaseFirestore.instance.collection('quotes');

  // Stream<QuerySnapshot<Map<String, dynamic>>> getQuotesDocuments() async* {
  //   yield* _quotesCollection.snapshots();
  // }

  Future<QuerySnapshot<Map<String, dynamic>>> getQuotesDocuments() async {
    return _quotesCollection.get();
  }

  Future addQuote(Map<String, dynamic> quoteJsonParsed) async {
    int lastIndex =
        await _quotesCollection.get().then((value) => value.docs.length);
    await _quotesCollection.doc(lastIndex.toString()).set(quoteJsonParsed);
  }
}
