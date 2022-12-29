import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_app/models/quote.dart';
import 'package:quotes_app/src/controllers/quotes_list_controller.dart';

class QuoteCreateDialog extends StatefulWidget {
  const QuoteCreateDialog({super.key});
  @override
  Key? get key => const Key("QuoteCreateDialog");

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
                        child: Container(
                          padding: const EdgeInsets.only(top: 6),
                          child: TextFormField(
                            cursorColor: Theme.of(context).primaryColorLight,
                            style: Theme.of(context).textTheme.headline5,
                            controller: authorNameController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: null,
                              hintText: "your name to remember!",
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(color: Colors.blue),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    color: Theme.of(context).primaryColor,
                    child: TextFormField(
                      maxLines: 5,
                      cursorColor: Theme.of(context).primaryColorLight,
                      controller: quoteTextController,
                      style: Theme.of(context).textTheme.headline4,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Your quote to consider!",
                        hintStyle: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: Colors.blue),
                      ),
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
