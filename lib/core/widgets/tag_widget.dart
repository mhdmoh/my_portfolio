// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:my_portfolio/config/colors.dart';

class TagWidget extends StatelessWidget {
  const TagWidget({
    super.key,
    required this.label,
    this.highlighted = false,
  });

  final String label;
  final bool highlighted;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: MyColors.secondary.color.withAlpha(200)),
        color: MyColors.secondary.color.withAlpha(30),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text(
        label,
        style: TextStyle(color: MyColors.secondary.color.withAlpha(200)),
      ),
    );
  }
}
