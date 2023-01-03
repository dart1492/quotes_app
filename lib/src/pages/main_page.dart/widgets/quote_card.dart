import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_app/models/quote.dart';
import 'package:quotes_app/services/firebase_services/cloud_firestore.dart';
import 'package:quotes_app/src/controllers/quotes_list_controller.dart';
import 'package:quotes_app/src/pages/main_page.dart/widgets/full_quote_dialog.dart';

class QuoteCard extends StatefulWidget {
  const QuoteCard({
    Key? key,
    required this.quote,
  }) : super(key: key);

  final Quote quote;
  @override
  State<QuoteCard> createState() => _QuoteCardState();
}

class _QuoteCardState extends State<QuoteCard> {
  late bool isLiked;
  String mainDisplayText = '';
  final quotesListController = Get.find<QuotesListController>();
  final cloudStore = CloudFirestore();

  // @override
  // void initState() {
  //   mainDisplayText = widget.quote.quoteText ?? "";
  //   if (mainDisplayText.length > 14) {
  //     mainDisplayText = '${mainDisplayText.substring(0, 15)}...';
  //   }
  //   super.initState();
  // }

  String _cutQuoteText() {
    String cardText = widget.quote.quoteText!;
    if (cardText.length > 14) {
      return "${cardText.substring(0, 14)}...";
    } else {
      return cardText;
    }
  }

  Future<void> _displayFullQuote(BuildContext context, String quoteText) async {
    return showDialog(
        context: context,
        builder: (_) {
          return FullQuoteDialog(fullQuote: quoteText);
        });
  }

  @override
  Widget build(BuildContext context) {
    print("rebuild quote card");

    return Card(
      color: Theme.of(context).backgroundColor,
      elevation: 0,
      child: ListTile(
        title: Text(widget.quote.author ?? 'anonymous',
            style: Theme.of(context).textTheme.headline6),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _cutQuoteText(), // mainDisplayText,
              style: Theme.of(context).textTheme.headline3,
            ),
            // FutureBuilder<Object>(
            //   future:
            //       quotesListController.checkQuoteRated(widget.quote.uniqueID!),
            //   builder: (context, snapshot) {
            //     if (snapshot.hasData) {
            //       return Row(
            //         children: [
            //           FutureBuilder(
            //               future:
            //                   cloudStore.getQuoteRating(widget.quote.uniqueID!),
            //               builder: (context, snapshot) {
            //                 if (snapshot.hasData) {
            //                   return Text(
            //                     snapshot.data!.toString(),
            //                     //widget.quote.rating.toString(),
            //                     style: Theme.of(context).textTheme.headline5,
            //                   );
            //                 } else {
            //                   return const Loader();
            //                 }
            //               }),
            //           IconButton(
            //             icon: snapshot.data == true
            //                 ? const Icon(Icons.star)
            //                 : const Icon(Icons.star_border_outlined),
            //             onPressed: () {
            //               bool isLiked = (snapshot.data) as bool;

            //               quotesListController.rateQuote(
            //                   widget.quote.uniqueID, !isLiked);
            //               setState(() {});
            //             },
            //             color: const Color(0xFFEBFF00),
            //           ),
            //         ],
            //       );
            //     } else {
            //       return const Loader();
            //     }
            //   },
            // ),
          ],
        ),
        tileColor: Theme.of(context).listTileTheme.tileColor,
        onTap: () {
          _displayFullQuote(context, widget.quote.quoteText!);
        },
      ),
    );
  }
}
