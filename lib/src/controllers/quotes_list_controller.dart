import 'package:get/get.dart';
import 'package:quotes_app/models/quote.dart';
import 'package:quotes_app/services/firebase_services/cloud_firestore.dart';

class QuotesListController extends GetxController {
  var currentQuotes = <Quote>[].obs;
  final _firestoreService = CloudFirestore();

  @override
  onInit() {
    super.onInit();
    loadQuotes();
  }

  Future<void> loadQuotes() async {
    List<Quote> newQuotes = [];
    await _firestoreService.getQuotesDocuments().then((value) {
      for (var element in value.docChanges) {
        newQuotes.add(Quote.fromJson(element.doc.data()!));
      }
    });
    currentQuotes.value = newQuotes;
  }

  Future<void> addQuote(Quote newQuote) async {
    await _firestoreService.addQuote(newQuote.toJson());
    loadQuotes();
  }
}
