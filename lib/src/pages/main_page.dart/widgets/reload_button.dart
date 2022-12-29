// import 'package:flutter/material.dart';
// import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:quotes_app/src/controllers/quotes_list_controller.dart';

// class ReloadButton extends StatefulWidget {
//   const ReloadButton({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<ReloadButton> createState() => _ReloadButtonState();
// }

// class _ReloadButtonState extends State<ReloadButton> {
//   final quotesListController = Get.find<QuotesListController>();
//   attachNotifyDialog(BuildContext context, AlignmentGeometry alignment) async {
//     SmartDialog.showAttach(
//       targetContext: context,
//       usePenetrate: true,
//       alignment: alignment,
//       clickMaskDismiss: false,
//       builder: (_) => Container(
//         margin: const EdgeInsets.fromLTRB(
//           60,
//           0,
//           0,
//           0,
//         ),
//         width: 100,
//         height: 50,
//         child: Text("Reload", style: Theme.of(context).textTheme.headline5),
//       ),
//     );
//     await Future.delayed(const Duration(milliseconds: 350));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: (event) async {
//         await attachNotifyDialog(context, Alignment.centerRight);
//       },
//       onExit: (event) {
//         SmartDialog.dismiss();
//       },
//       child: IconButton(
//         padding: EdgeInsets.zero,
//         onPressed: () async {
//           quotesListController.loadQuotes();
//         },
//         icon: SvgPicture.asset(
//           'assets/7gdjj2.svg',
//           width: 50,
//           height: 50,
//         ),
//       ),
//     );
//   }
// }
