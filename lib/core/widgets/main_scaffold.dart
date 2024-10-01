import 'package:flutter/material.dart';
import 'package:my_portfolio/config/assets.dart';
import 'package:my_portfolio/config/colors.dart';

class BluredWidget extends StatelessWidget {
  const BluredWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 0.4;
    return Container(
      width: width,
      height: width,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: MyColors.secondary.color.withAlpha(18),
            blurRadius: width * 0.9,
          ),
        ],
      ),
    );
  }
}

class MainScaffold extends StatefulWidget {
  const MainScaffold({
    super.key,
    required this.child,
    this.contentPadding,
  });
  final Widget child;
  final EdgeInsets? contentPadding;

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  Offset pos = Offset.zero;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primary.color,
      body: LayoutBuilder(builder: (context, cons) {
        return Stack(
          children: [
            Opacity(
              opacity: 0.05,
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height,
                child: Image.asset(
                  MyAssets.background.image,
                  repeat: ImageRepeat.repeat,
                ),
              ),
            ),
            Padding(
              padding: widget.contentPadding ??
                  EdgeInsets.symmetric(
                    horizontal: cons.maxWidth > 1100 ? (MediaQuery.sizeOf(context).width) * 0.1 : 20,
                  ),
              child: widget.child,
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
              child: MouseRegion(
                opaque: false,
                onHover: (event) {
                  setState(() {
                    pos = Offset(
                      event.position.dx - (MediaQuery.sizeOf(context).width * 0.5),
                      event.position.dy - MediaQuery.sizeOf(context).width * 0.25,
                    );
                  });
                },
                child: Transform.translate(
                  offset: pos,
                  child: const BluredWidget(),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
