import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_app/models/quote.dart';
import 'package:quotes_app/services/firebase_services/cloud_firestore.dart';
import 'package:quotes_app/src/controllers/quotes_list_controller.dart';
import 'package:quotes_app/src/pages/main_page.dart/widgets/quote_card.dart';
import 'package:quotes_app/src/shared/loader.dart';

class QuotesListView extends StatefulWidget {
  const QuotesListView({
    Key? key,
  }) : super(key: key);

  @override
  State<QuotesListView> createState() => _QuotesListViewState();
}

class _QuotesListViewState extends State<QuotesListView> {
  final quotesController = Get.put(QuotesListController());
  final _cloudStore = CloudFirestore();

  @override
  Widget build(BuildContext context) {
    print("rebuild");
    return SizedBox(
      width: MediaQuery.of(context).size.width / 5,
      child: GetX<QuotesListController>(
        builder: (controller) {
          if (controller.currentQuotes.isNotEmpty) {
            return ListView.separated(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              shrinkWrap: true,
              itemCount: controller.currentQuotes.length,
              scrollDirection: Axis.vertical,
              separatorBuilder: (context, index) {
                return const SizedBox(height: 40);
              },
              itemBuilder: ((context, index) {
                // print(controller.currentQuotes[index]);
                return QuoteCard(
                  quote: controller.currentQuotes[index],
                );
              }),
            );
          } else {
            return Center(
              child: Text("No quotes yet...",
                  style: Theme.of(context).textTheme.headline4),
            );
          }
        },
      ),
    );
  }
}

// return ListView.separated(
//                 padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
//                 shrinkWrap: true,
//                 itemCount: newQuotesLength,
//                 scrollDirection: Axis.vertical,
//                 separatorBuilder: (context, index) {
//                   return const SizedBox(height: 40);
//                 },
//                 itemBuilder: ((context, index) {
//                   return QuoteCard(
//                     quote: Quote.fromJson(newQuotes[index].data()),
//                   );
//                 }),
//               );