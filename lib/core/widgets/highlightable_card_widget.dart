import 'package:flutter/material.dart';

class HighlightableCard extends StatefulWidget {
  const HighlightableCard({
    super.key,
    required this.child,
    required this.onHighlightChanged,
    this.onTapped,
  });

  final Widget child;
  final Function(bool highlighted) onHighlightChanged;
  final VoidCallback? onTapped;

  @override
  State<HighlightableCard> createState() => _HighlightableCardState();
}

class _HighlightableCardState extends State<HighlightableCard> {
  bool highlighted = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTapped,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: MouseRegion(
        onEnter: (event) {
          setState(() {
            highlighted = true;
            widget.onHighlightChanged(true);
          });
        },
        onExit: (event) {
          setState(() {
            highlighted = false;
            widget.onHighlightChanged(false);
          });
        },
        child: AnimatedContainer(
          duration: Durations.short2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: highlighted ? Colors.white.withAlpha(20) : Colors.transparent,
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
