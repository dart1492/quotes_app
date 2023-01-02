import 'package:flutter/material.dart';

class GradientHighlitedButton extends StatefulWidget {
  const GradientHighlitedButton({
    Key? key,
    required this.childText,
    required this.onButtonTap,
  }) : super(key: key);

  final String childText;
  final Function? onButtonTap;
  @override
  Key? get key => const Key("PostNowButton");
  @override
  State<GradientHighlitedButton> createState() =>
      _GradientHighlitedButtonState();
}

class _GradientHighlitedButtonState extends State<GradientHighlitedButton>
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
          widget.onButtonTap!();
        },
        child: Transform.scale(
          scale: _scale,
          child: Padding(
            padding: const EdgeInsets.all(30),
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
      ),
    );
  }
}
