import 'package:flutter/material.dart';

import 'package:quotes_app/src/controllers/auth_controller.dart';
import 'package:quotes_app/src/controllers/quotes_list_controller.dart';
import 'package:quotes_app/src/shared/loader.dart';

class FullQuoteDialog extends StatefulWidget {
  const FullQuoteDialog({super.key, required this.fullQuote});
  @override
  Key? get key => const Key("QuoteCreateDialog");
  final String? fullQuote;

  @override
  State<StatefulWidget> createState() => FullQuoteDialogState();
}

class FullQuoteDialogState extends State<FullQuoteDialog>
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

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 2;
    double width = MediaQuery.of(context).size.width / 6;

    return FutureBuilder(
        future: AuthController.instance.getUsername(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
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
                          child: Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text("by: ${snapshot.data}",
                                style: Theme.of(context).textTheme.headline5),
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: SingleChildScrollView(
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              child: Text(widget.fullQuote!,
                                  style: Theme.of(context).textTheme.headline4),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Close",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(
                                      color: Theme.of(context).dividerColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return const Loader();
          }
        });
  }
}
