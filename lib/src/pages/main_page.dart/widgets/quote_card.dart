import 'package:flutter/material.dart';
import 'package:quotes_app/models/quote.dart';

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
  bool isLiked = false;
  String mainDisplayText = '';

  @override
  void initState() {
    mainDisplayText = widget.quote.quoteText ?? "";
    if (mainDisplayText.length > 14) {
      mainDisplayText = '${mainDisplayText.substring(0, 15)}...';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).backgroundColor,
      elevation: 0,
      child: ListTile(
        title: Text(widget.quote.author ?? "null author",
            style: Theme.of(context).textTheme.headline6),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              mainDisplayText,
              style: Theme.of(context).textTheme.headline3,
            ),
            Row(
              children: [
                Text(
                  widget.quote.rating.toString(),
                  style: Theme.of(context).textTheme.headline5,
                ),
                IconButton(
                  icon: isLiked
                      ? const Icon(Icons.star)
                      : const Icon(Icons.star_border_outlined),
                  onPressed: () {
                    setState(() {
                      isLiked = !isLiked;
                    });
                  },
                  color: const Color(0xFFEBFF00),
                ),
              ],
            )
          ],
        ),
        tileColor: Theme.of(context).listTileTheme.tileColor,
        onTap: () {},
      ),
    );
  }
}
