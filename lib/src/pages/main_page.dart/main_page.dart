import 'package:flutter/material.dart';
import 'package:quotes_app/src/controllers/app_user_controller.dart';
import 'package:quotes_app/src/controllers/auth_controller.dart';
import 'package:quotes_app/src/controllers/quotes_filter_Controller.dart';
import 'package:quotes_app/src/controllers/quotes_list_controller.dart';

import 'package:quotes_app/src/pages/main_page.dart/widgets/additional_info_icon.dart';
import 'package:get/get.dart';
import 'package:quotes_app/src/pages/main_page.dart/widgets/quote_create_button.dart';
import 'package:quotes_app/src/pages/main_page.dart/widgets/quote_search_field.dart';
import 'package:quotes_app/src/pages/main_page.dart/widgets/quotes_list_view.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  final controller = Get.put(AppUserController());
  final quotesController = Get.put(QuotesListController());
  final filterController = Get.put(QuotesFilterController());
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
        actions: const [
          AddInfoIcon(),
        ],
        leading: IconButton(
          onPressed: () {
            AuthController.instance.signOut();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Expanded(
              flex: 2,
              child: QuoteSearchField(),
            ),
            Expanded(
              flex: 6,
              child: QuotesListView(),
            ),
            Expanded(
              flex: 2,
              child: QuoteCreateButton(),
            ),
          ],
        ),
      ),
    );
  }
}
