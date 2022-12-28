import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_app/models/quote.dart';
import 'package:quotes_app/src/controllers/quotes_list_controller.dart';

class QuoteCreateDialog extends StatefulWidget {
  const QuoteCreateDialog({super.key});

  @override
  State<StatefulWidget> createState() => QuoteCreateDialogState();
}

class QuoteCreateDialogState extends State<QuoteCreateDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  late QuotesListController quotesListController;
  late TextEditingController authorNameController;
  late TextEditingController quoteTextController;
  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    quotesListController = Get.find<QuotesListController>();

    authorNameController = TextEditingController();
    quoteTextController = TextEditingController();

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 3;
    double width = MediaQuery.of(context).size.width / 6;

    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            height: height,
            width: width,
            decoration: ShapeDecoration(
              color: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Text("by:",
                              style: Theme.of(context).textTheme.headline5),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: TextFormField(
                          controller: authorNameController,
                          decoration: InputDecoration(
                            hintText: "your name?",
                            hintStyle: Theme.of(context).textTheme.headline5,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Container(
                    color: Colors.amber,
                    child: TextFormField(
                      controller: quoteTextController,
                      decoration: InputDecoration(
                          hintText: "Your quote here!",
                          hintStyle: Theme.of(context).textTheme.headline4),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Cancel",
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Quote newQuote = Quote(
                              author: authorNameController.text,
                              quoteText: quoteTextController.text,
                              rating: 0);
                          quotesListController.addQuote(newQuote);
                          Navigator.pop(context);
                        },
                        child: Text("Done!",
                            style: Theme.of(context).textTheme.headline4),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
