import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:quotes_app/src/controllers/quotes_list_controller.dart';

class QuoteSearchField extends StatefulWidget {
  const QuoteSearchField({
    Key? key,
  }) : super(key: key);

  @override
  State<QuoteSearchField> createState() => _QuoteSearchFieldState();
}

class _QuoteSearchFieldState extends State<QuoteSearchField> {
  var controller = Get.find<QuotesListController>();
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 6,
      padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
      child: TextFormField(
        controller: searchController,
        style: Theme.of(context).textTheme.headline6,
        decoration: InputDecoration(
          hintText: "Search for a quote",
          hintStyle: Theme.of(context).textTheme.headline6,
          suffixIcon: const Icon(Icons.search),
        ),
        onChanged: (value) {
          print(value);
          controller.filterQuotes(value);
        },
      ),
    );
  }
}
