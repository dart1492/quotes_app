import 'package:flutter/material.dart';
import 'package:quotes_app/src/controllers/app_user_controller.dart';
import 'package:quotes_app/src/controllers/auth_controller.dart';

import 'package:quotes_app/src/pages/main_page.dart/global_quotes_section/widgets/additional_info_icon.dart';
import 'package:get/get.dart';
import 'package:quotes_app/src/pages/main_page.dart/global_quotes_section/widgets/quote_create_button.dart';
import 'package:quotes_app/src/pages/main_page.dart/global_quotes_section/widgets/quotes_list_view.dart';
import 'package:quotes_app/src/shared/loader.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  final controller = Get.put(AppUserController());
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
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: FutureBuilder(
              future: AuthController.instance.getUsername(),
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Text("Authorised as: ${snapshot.data!}",
                        style: Theme.of(context).textTheme.headline4),
                  );
                } else {
                  return const Loader();
                }
              }),
            ),
          ),
          Expanded(
            flex: 8,
            child: Center(
              child: Column(
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
