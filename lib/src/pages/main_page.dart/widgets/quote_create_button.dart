import 'package:flutter/material.dart';
import 'package:quotes_app/src/pages/main_page.dart/widgets/quote_create_dialog.dart';

class PostButton extends StatefulWidget {
  const PostButton({
    Key? key,
  }) : super(key: key);

  @override
  State<PostButton> createState() => _PostButtonState();
}

class _PostButtonState extends State<PostButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        QuoteCreateButton(),
        // ReloadButton(),
      ],
    );
  }
}

class QuoteCreateButton extends StatefulWidget {
  const QuoteCreateButton({
    Key? key,
  }) : super(key: key);

  @override
  State<QuoteCreateButton> createState() => _QuoteCreateButtonState();
}

class _QuoteCreateButtonState extends State<QuoteCreateButton>
    with SingleTickerProviderStateMixin {
  late double _scale;
  late AnimationController _controller;
  bool isHovered = false;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _tapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _tapUp(TapUpDetails details) {
    _controller.reverse();
  }

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (_) {
          return const QuoteCreateDialog();
        });
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHovered = false;
        });
      },
      child: GestureDetector(
        onTapDown: _tapDown,
        onTapUp: _tapUp,
        onTap: () {
          _displayTextInputDialog(context);
        },
        child: Transform.scale(
          scale: _scale,
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width / 12,
            height: 50,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Color(0x80000000),
                  blurRadius: 12.0,
                  offset: Offset(0.0, 5.0),
                ),
              ],
              borderRadius: BorderRadius.circular(100.0),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: isHovered
                      ? [
                          const Color.fromARGB(255, 25, 104, 130),
                          const Color.fromARGB(255, 140, 85, 112),
                        ]
                      : [
                          const Color(0xff33ccff),
                          const Color(0xffff99cc),
                        ]),
            ),
            child: Text(
              "Post now!",
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}

// SmartDialog.show(builder: (context) {
  //               return Container(
  //                 height: MediaQuery.of(context).size.height / 1.5,
  //                 width: MediaQuery.of(context).size.width / 5,
  //                 decoration: BoxDecoration(
  //                   color: Theme.of(context).primaryColor,
  //                   borderRadius: BorderRadius.circular(10),
  //                 ),
  //                 alignment: Alignment.center,
  //                 child: Form(
  //                   child: Column(
  //                     children: [
  //                       Container(
  //                         height: 100,
  //                         child: Row(
  //                           children: [
  //                             Container(
  //                               padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
  //                               child: Text("by:",
  //                                   style:
  //                                       Theme.of(context).textTheme.headline5),
  //                             ),
  //                             Container(
  //                               height: 100,
  //                               width: 100,
  //                               alignment: Alignment.centerLeft,
  //                               child: TextFormField(),
  //                             ),
  //                           ],
  //                         ),
  //                       )
  //                     ],
  //                   ),
  //                 ),
  //               );
  //             });