import 'package:flutter/material.dart';
import 'package:quotes_app/src/pages/main_page.dart/widgets/additional_info_icon.dart';
import 'package:quotes_app/src/pages/main_page.dart/widgets/quote_create_button.dart';
import 'widgets/quotes_list_view.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF282424),
      appBar: AppBar(
        toolbarHeight: 100,
        title: Text(
          "Global Quotes",
          style: Theme.of(context).textTheme.headline2,
        ),
        centerTitle: true,
        actions: const [AddInfoIcon()],
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              SizedBox(
                height: 50,
              ),
              Expanded(
                flex: 6,
                child: QuotesListView(),
              ),
              Expanded(
                flex: 1,
                child: QuoteCreateButton(),
              ),
            ]),
      ),
    );
  }
}
