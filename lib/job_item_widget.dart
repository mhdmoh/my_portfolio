// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:my_portfolio/config/colors.dart';
import 'package:my_portfolio/config/my_dimentions.dart';
import 'package:my_portfolio/core/utils/funcs.dart';
import 'package:my_portfolio/core/widgets/highlightable_card_widget.dart';
import 'package:my_portfolio/core/widgets/tag_widget.dart';
import 'package:my_portfolio/models/job_model.dart';

class JobItemWidget extends StatefulWidget {
  const JobItemWidget({
    super.key,
    required this.job,
  });
  final JobModel job;

  @override
  State<JobItemWidget> createState() => _JobItemWidgetState();
}

class _JobItemWidgetState extends State<JobItemWidget> {
  bool highlighted = false;

  @override
  Widget build(BuildContext context) {
    return HighlightableCard(
      onTapped: widget.job.website != null ? () => openUrl(widget.job.website!) : null,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                "${widget.job.start} - ${widget.job.end}",
                style: const TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
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
                          text: widget.job.title,
                        ),
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
                          text: widget.job.company,
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
                    widget.job.description,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: MyDimentions.textSizeBodyMedium.size,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [...widget.job.tags.map((e) => TagWidget(label: e))],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      onHighlightChanged: (highlighted) {
        setState(() {
          this.highlighted = highlighted;
        });
      },
    );
  }
}
