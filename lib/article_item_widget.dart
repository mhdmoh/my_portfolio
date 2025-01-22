import 'package:flutter/material.dart';
import 'package:my_portfolio/config/colors.dart';
import 'package:my_portfolio/config/my_dimentions.dart';
import 'package:my_portfolio/core/utils/funcs.dart';
import 'package:my_portfolio/core/widgets/highlightable_card_widget.dart';
import 'package:my_portfolio/core/widgets/tag_widget.dart';
import 'package:my_portfolio/models/article_model.dart';

class ArticleItemWidget extends StatefulWidget {
  final ArticleModel article;

  const ArticleItemWidget({super.key, required this.article});

  @override
  State<ArticleItemWidget> createState() => _ArticleItemWidgetState();
}

class _ArticleItemWidgetState extends State<ArticleItemWidget> {
  bool highlighted = false;

  @override
  Widget build(BuildContext context) {
    return HighlightableCard(
      onTapped: () => openUrl(widget.article.link),
      onHighlightChanged: (highlighted) {
        setState(() {
          this.highlighted = highlighted;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
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
                    text: widget.article.title,
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
            const SizedBox(height: 8),
            Text(
              'Published on: ${widget.article.publishDate}',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[600],
                  ),
            ),
            const SizedBox(height: 12),
            Text(
              widget.article.summary,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: widget.article.topics.map((topic) {
                return TagWidget(label: topic);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
