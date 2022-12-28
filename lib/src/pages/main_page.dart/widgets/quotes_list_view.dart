import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_app/src/controllers/quotes_list_controller.dart';
import 'package:quotes_app/src/pages/main_page.dart/widgets/quote_card.dart';

class QuotesListView extends StatefulWidget {
  const QuotesListView({
    Key? key,
  }) : super(key: key);

  @override
  State<QuotesListView> createState() => _QuotesListViewState();
}

class _QuotesListViewState extends State<QuotesListView> {
  final quotesController = Get.put(QuotesListController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 5,
      child: GetX<QuotesListController>(builder: (controller) {
        return ListView.separated(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          shrinkWrap: true,
          itemCount: controller.currentQuotes.length,
          scrollDirection: Axis.vertical,
          separatorBuilder: (context, index) {
            return const SizedBox(height: 40);
          },
          itemBuilder: ((context, index) {
            return QuoteCard(
              quote: controller.currentQuotes[index],
            );
          }),
        );
      }),
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