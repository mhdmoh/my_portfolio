// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:my_portfolio/config/assets.dart';
import 'package:my_portfolio/config/colors.dart';
import 'package:my_portfolio/config/extensions.dart';
import 'package:my_portfolio/config/my_dimentions.dart';
import 'package:my_portfolio/core/utils/funcs.dart';
import 'package:my_portfolio/core/widgets/highlightable_card_widget.dart';
import 'package:my_portfolio/core/widgets/highlightable_svg_widget.dart';
import 'package:my_portfolio/core/widgets/tag_widget.dart';

import 'package:my_portfolio/models/project_model.dart';

class ProjectItemWidget extends StatefulWidget {
  const ProjectItemWidget({
    super.key,
    required this.project,
  });
  final ProjectModel project;

  @override
  State<ProjectItemWidget> createState() => _ProjectItemWidgetState();
}

class _ProjectItemWidgetState extends State<ProjectItemWidget> {
  bool highlighted = false;

  @override
  Widget build(BuildContext context) {
    final image = ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: widget.project.imagePath != null
          ? Image.asset(
              widget.project.imagePath!,
              width: 60,
              height: 60,
            )
          : Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(color: Colors.white.withAlpha(highlighted ? 80 : 50)),
              child: Center(
                child: Text(
                  widget.project.projectName[0],
                  style: TextStyle(
                    color: highlighted ? MyColors.secondary.color : Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
    );
    return HighlightableCard(
      onTapped: widget.project.link != null ? () => openUrl(widget.project.link!) : null,
      onHighlightChanged: (highlighted) {
        setState(() {
          this.highlighted = highlighted;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                image,
                const SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: highlighted ? MyColors.secondary.color : Colors.white,
                          fontSize: MyDimentions.textSizeBodyLarge.size,
                        ),
                        children: [
                          TextSpan(
                            text: widget.project.projectName,
                          ),
                          if (widget.project.companyName != null) ...[
                            WidgetSpan(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4),
                                child: Text(
                                  "•",
                                  style: TextStyle(
                                    color: highlighted ? MyColors.secondary.color : Colors.white,
                                    fontSize: MyDimentions.textSizeBodyLarge.size,
                                  ),
                                ),
                              ),
                            ),
                            TextSpan(
                              text: widget.project.companyName,
                            ),
                          ],
                          WidgetSpan(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4),
                              child: Transform.rotate(
                                angle: degreesToRadians(-135),
                                child: Icon(
                                  Icons.arrow_downward_rounded,
                                  size: 16,
                                  color: highlighted ? MyColors.secondary.color : Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        if (widget.project.androidLink != null) HighlightableSvg(clipRadius: 6, path: MyAssets.androidLogo.svg, onClicked: () => openUrl(widget.project.androidLink!)),
                        if (widget.project.iosLink != null) HighlightableSvg(clipRadius: 6, path: MyAssets.iosLogo.svg, onClicked: () => openUrl(widget.project.iosLink!)),
                      ],
                    ).seperated(const SizedBox(
                      width: 8,
                    ))
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              widget.project.description,
              style: const TextStyle(color: Colors.grey),
            ),
            if (widget.project.tags != null) ...[
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [...widget.project.tags!.map((e) => TagWidget(label: e))],
              ),
            ],
          ],
        ).seperated(const SizedBox(width: 16)),
      ),
    );
  }
}
