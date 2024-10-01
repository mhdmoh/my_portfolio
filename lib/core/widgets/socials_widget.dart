import 'package:flutter/material.dart';
import 'package:my_portfolio/config/assets.dart';
import 'package:my_portfolio/config/extensions.dart';
import 'package:my_portfolio/core/utils/funcs.dart';
import 'package:my_portfolio/core/widgets/highlightable_svg_widget.dart';

class SocialsWidget extends StatelessWidget {
  const SocialsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        HighlightableSvg(
          path: MyAssets.githubLogo.svg,
          onClicked: () => openUrl("https://github.com/mhdmoh"),
        ),
        HighlightableSvg(
          path: MyAssets.linkedInLogo.svg,
          onClicked: () => openUrl("https://www.linkedin.com/in/mohamad-n-mohamad"),
        ),
        HighlightableSvg(
          path: MyAssets.mediumLogo.svg,
          onClicked: () => openUrl("https://medium.com/@mhd.nidal.mhd"),
        ),
      ],
    ).seperated(const SizedBox(
      width: 16,
    ));
  }
}
