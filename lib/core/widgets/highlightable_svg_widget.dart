import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_portfolio/config/colors.dart';
import 'package:my_portfolio/config/extensions.dart';

class HighlightableSvg extends StatefulWidget {
  const HighlightableSvg({
    super.key,
    required this.path,
    required this.onClicked,
    this.clipRadius,
  });

  final String path;
  final VoidCallback onClicked;
  final double? clipRadius;

  @override
  State<HighlightableSvg> createState() => _HighlightableSvgState();
}

class _HighlightableSvgState extends State<HighlightableSvg> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onClicked,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: MouseRegion(
        onEnter: (event) {
          setState(() {
            hovering = true;
          });
        },
        onExit: (event) {
          setState(() {
            hovering = false;
          });
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(widget.clipRadius ?? 0),
          child: SvgPicture.asset(
            widget.path,
            colorFilter: (hovering ? MyColors.secondary.color : Colors.white).filter,
            width: 26,
            height: 26,
          ),
        ),
      ),
    );
  }
}
