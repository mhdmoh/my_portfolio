// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:my_portfolio/config/colors.dart';
import 'package:my_portfolio/config/extensions.dart';
import 'package:my_portfolio/config/my_dimentions.dart';
import 'package:my_portfolio/core/utils/funcs.dart';
import 'package:my_portfolio/core/widgets/highlightable_card_widget.dart';

import 'package:my_portfolio/models/education_model.dart';

class EducationItemWidget extends StatefulWidget {
  const EducationItemWidget({
    super.key,
    required this.education,
  });
  final EducationModel education;

  @override
  State<EducationItemWidget> createState() => _EducationItemWidgetState();
}

class _EducationItemWidgetState extends State<EducationItemWidget> {
  bool highlighted = false;
  @override
  Widget build(BuildContext context) {
    final duration = Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        "${widget.education.from} - ${widget.education.to}",
        style: const TextStyle(color: Colors.grey),
      ),
    );
    return HighlightableCard(
      onTapped: widget.education.website != null ? () => openUrl(widget.education.website!) : null,
      onHighlightChanged: (highlighted) {
        setState(() {
          this.highlighted = highlighted;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (context.isNotMobile) ...[duration, const SizedBox(width: 16)],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (context.isMobile) ...[duration, const SizedBox(height: 8)],
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: highlighted ? MyColors.secondary.color : Colors.white,
                        fontSize: MyDimentions.textSizeBodyLarge.size,
                      ),
                      children: [
                        TextSpan(
                          text: widget.education.name,
                        ),
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
                  Text(
                    widget.education.institution,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: MyDimentions.textSizeBodyMedium.size,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
