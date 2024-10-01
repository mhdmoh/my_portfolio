import 'package:flutter/material.dart';
import 'package:my_portfolio/config/colors.dart';
import 'package:my_portfolio/config/extensions.dart';
import 'package:my_portfolio/config/my_dimentions.dart';
import 'package:my_portfolio/section_notifier.dart';

class PortfolioSections extends StatefulWidget {
  const PortfolioSections({super.key});

  @override
  State<PortfolioSections> createState() => _PortfolioSectionsState();
}

class _PortfolioSectionsState extends State<PortfolioSections> {
  Widget _buildSection(Sections section, Sections curr) {
    return GestureDetector(
      onTap: () {
        setState(() {
          SectionNotifier.forceUpdate.value = section;
        });
      },
      child: Row(
        children: [
          AnimatedContainer(
            duration: Durations.short3,
            margin: const EdgeInsets.all(4),
            width: curr == section ? 100 : 50,
            height: 2,
            decoration: BoxDecoration(
              color: MyColors.white.color.withAlpha(curr == section ? 255 : 150),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            section.name.toUpperCase(),
            style: TextStyle(
              color: MyColors.white.color.withAlpha(curr == section ? 255 : 150),
              fontWeight: FontWeight.bold,
              fontSize: MyDimentions.textSizeLabelLarge.size,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Sections>(
      valueListenable: SectionNotifier.selectedSection,
      builder: (context, value, child) {
        return Column(
          children: [...Sections.values.map((e) => _buildSection(e, value))],
        ).seperated(const SizedBox(height: 8));
      },
    );
  }
}
