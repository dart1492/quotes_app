// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';

class BounceGradientButton extends StatefulWidget {
  const BounceGradientButton({
    Key? key,
    required this.childText,
    this.onButtonTap,
  }) : super(key: key);
  final String childText;
  final Function? onButtonTap;
  @override
  State<BounceGradientButton> createState() => _BounceGradientButtonState();
}

class _BounceGradientButtonState extends State<BounceGradientButton> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
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
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Bounce(
          onPressed: () {
            widget.onButtonTap!();
          },
          duration: const Duration(milliseconds: 200),
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
              widget.childText,
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
