// ignore: file_names
import 'package:get/get.dart';

class QuotesFilterController extends GetxController {
  var filterText = "I like";

  filterQuotes(String newFilterText) {
    filterText = newFilterText;
    update();
  }
}
