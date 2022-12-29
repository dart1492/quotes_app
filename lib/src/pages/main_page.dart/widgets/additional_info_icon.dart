import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

class AddInfoIcon extends StatefulWidget {
  const AddInfoIcon({
    Key? key,
  }) : super(key: key);

  @override
  State<AddInfoIcon> createState() => _AddInfoIconState();
}

class _AddInfoIconState extends State<AddInfoIcon> {
  attachAddInfoDialog(BuildContext context, AlignmentGeometry alignment) async {
    SmartDialog.showAttach(
      targetContext: context,
      usePenetrate: true,
      alignment: alignment,
      clickMaskDismiss: false,
      builder: (_) => Container(
        margin: const EdgeInsets.fromLTRB(
          0,
          0,
          0,
          0,
        ),
        width: 100,
        height: 120,
        child: Column(
          children: [
            Text("by: Dart", style: Theme.of(context).textTheme.headline5),
            Text("Version: 0.0.1",
                style: Theme.of(context).textTheme.headline5),
          ],
        ),
      ),
    );
    await Future.delayed(const Duration(milliseconds: 350));
  }

  bool isRedirected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: const Key("AdditionalInfoButton"),
      onTap: () {
        launchUrl(
          Uri.parse('https://github.com/dart1492'),
        );
        setState(() {
          isRedirected = true;
        });
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (event) async {
          await attachAddInfoDialog(context, Alignment.bottomCenter);
        },
        onExit: (event) async {
          await SmartDialog.dismiss();
        },
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Image.asset(
            'assets/parfenon_icon.png',
          ),
        ),
      ),
    );
  }
}
