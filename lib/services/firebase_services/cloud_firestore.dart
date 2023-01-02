import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quotes_app/models/quote.dart';

class CloudFirestore {
  final _quotesCollection = FirebaseFirestore.instance.collection('quotes');
  final _usersCollection = FirebaseFirestore.instance.collection('users');
  final _quotesRatesCollection =
      FirebaseFirestore.instance.collection('quotes_rates');

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
    await _quotesRatesCollection.doc(newDocID).set({'rating': 0});
  }

  Stream<List<Quote>> getQuotesStream() {
    return _quotesCollection.snapshots().map(
      (event) {
        List<Quote> result = [];
        for (var element in event.docs) {
          result.add(Quote.fromJson(element.data()));
        }
        return result;
      },
    );
  }

  Future<void> likeGlobalQuote(String uniqueID, bool isLiked) async {
    if (isLiked) {
      // await _quotesCollection
      //     .doc(uniqueID)
      //     .update({"rating": FieldValue.increment(1)});

      await _quotesRatesCollection
          .doc(uniqueID)
          .update({"rating": FieldValue.increment(1)});
    } else {
      // await _quotesCollection
      //     .doc(uniqueID)
      //     .update({"rating": FieldValue.increment(-1)});

      await _quotesRatesCollection
          .doc(uniqueID)
          .update({"rating": FieldValue.increment(-1)});
    }
  }

  Future<void> manageLikedQuote(
      String uniqueID, bool isLiked, String uid) async {
    if (isLiked) {
      await _usersCollection.doc(uid).update({
        "likedIDs": FieldValue.arrayUnion([uniqueID])
      });
    } else {
      await _usersCollection.doc(uid).update({
        'likedIDs': FieldValue.arrayRemove([uniqueID])
      });
    }
  }

  Future<void> createUser(String uid, String username) async {
    await _usersCollection.doc(uid).set({'likedIDs': [], 'username': username});
  }

  Future<String> getUsername(String uid) async {
    return await _usersCollection.doc(uid).get().then(
          (value) => value.data()!['username'],
        );
  }

  Future<List<dynamic>> getLikedIDs(String uid) async {
    return await _usersCollection
        .doc(uid)
        .get()
        .then((value) => value.data()!['likedIDs']);
  }

  Future<int> getQuoteRating(String uniqueID) async {
    return await _quotesRatesCollection
        .doc(uniqueID)
        .get()
        .then((value) => value.data()!['rating']);
  }
}
