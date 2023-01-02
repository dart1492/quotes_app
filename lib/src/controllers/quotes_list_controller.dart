import 'package:get/get.dart';
import 'package:quotes_app/models/quote.dart';
import 'package:quotes_app/services/firebase_services/cloud_firestore.dart';
import 'package:quotes_app/src/controllers/auth_controller.dart';

class QuotesListController extends GetxController {
  var currentQuotes = <Quote>[].obs;
  final _firestoreService = CloudFirestore();

  @override
  onInit() {
    currentQuotes.bindStream(_firestoreService.getQuotesStream());
    super.onInit();

    // loadQuotes();
  }

  // Future<void> loadQuotes() async {
  //   List<Quote> newQuotes = [];
  //   await _firestoreService.getQuotesDocuments().then((value) {
  //     for (var element in value.docChanges) {
  //       newQuotes.add(Quote.fromJson(element.doc.data()!));
  //     }
  //   });
  //   currentQuotes.value = newQuotes;
  // }

  Future<void> addQuote(Quote newQuote) async {
    await _firestoreService.addQuote(newQuote.toJson());
  }

  Future<void> rateQuote(uniqueID, bool isLiked) async {
    await _firestoreService.manageLikedQuote(
        uniqueID, isLiked, AuthController.instance.getUID());
    await _firestoreService.likeGlobalQuote(uniqueID, isLiked);
  }

  Future<bool> checkQuoteRated(String uniqueID) async {
    var list =
        await _firestoreService.getLikedIDs(AuthController.instance.getUID());

    if (list.contains(uniqueID)) {
      return true;
    } else {
      return false;
    }
  }
}
