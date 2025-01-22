// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:my_portfolio/article_item_widget.dart';
import 'package:my_portfolio/config/extensions.dart';
import 'package:my_portfolio/config/my_dimentions.dart';
import 'package:my_portfolio/config/strings.dart';
import 'package:my_portfolio/core/utils/funcs.dart';
import 'package:my_portfolio/core/widgets/main_scaffold.dart';
import 'package:my_portfolio/core/widgets/socials_widget.dart';
import 'package:my_portfolio/education_item_widget.dart';
import 'package:my_portfolio/job_item_widget.dart';
import 'package:my_portfolio/models/article_model.dart';
import 'package:my_portfolio/models/education_model.dart';
import 'package:my_portfolio/models/job_model.dart';
import 'package:my_portfolio/models/project_model.dart';
import 'package:my_portfolio/portfolio_sections.dart';
import 'package:my_portfolio/project_item_widget.dart';
import 'package:my_portfolio/section_notifier.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final _aboutKey = GlobalKey();
  final _firstExpKey = GlobalKey();
  final _firstEduKey = GlobalKey();
  final _firstProjectKey = GlobalKey();
  final _firstArticleKey = GlobalKey();
  final _scrollController = ScrollController();

  double get edge => MediaQuery.sizeOf(context).height * 0.3;

  double _getWidgetYPos(GlobalKey key) {
    if (key.currentContext == null) return -1;
    final RenderBox renderBox = key.currentContext!.findRenderObject() as RenderBox;

    // Get the position and size of the widget
    final position = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;
    return position.dy + (size.height * 0.3);
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 300), () {
        _scrollController.addListener(() {
          final posExp = _getWidgetYPos(_firstExpKey);
          final posEdu = _getWidgetYPos(_firstEduKey);
          final posProj = _getWidgetYPos(_firstProjectKey);
          final posArticle = _getWidgetYPos(_firstArticleKey);
          final isExp = posExp < edge;
          final isEdu = posEdu < edge;
          final isProj = posProj < edge;
          final isArticle = posArticle < edge;

          if (isProj) {
            SectionNotifier.selectedSection.value = Sections.projects;
          } else if (isArticle) {
            SectionNotifier.selectedSection.value = Sections.articles;
          } else if (isEdu) {
            SectionNotifier.selectedSection.value = Sections.education;
          } else if (isExp) {
            SectionNotifier.selectedSection.value = Sections.experience;
          } else {
            SectionNotifier.selectedSection.value = Sections.about;
          }
        });
      });
    });
    SectionNotifier.forceUpdate.addListener(() {
      var value = SectionNotifier.forceUpdate.value;
      if (value != null) {
        Scrollable.ensureVisible(
          sectionMapper(value)!,
          duration: const Duration(milliseconds: 500),
        );
        SectionNotifier.forceUpdate.value = null;
      }
    });
    super.initState();
  }

  BuildContext? sectionMapper(Sections section) {
    switch (section) {
      case Sections.about:
        return _aboutKey.currentContext;
      case Sections.experience:
        return _firstExpKey.currentContext;
      case Sections.education:
        return _firstEduKey.currentContext;
      case Sections.projects:
        return _firstProjectKey.currentContext;
      case Sections.articles:
        return _firstArticleKey.currentContext;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      child: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: [
                if (context.isDesktop)
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.3,
                  ),
                Expanded(
                  child: Column(
                    key: _aboutKey,
                    children: [
                      if (context.isDesktop)
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.15,
                        ),
                      if (!context.isDesktop) const HeaderInfo(),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: context.isDesktop ? 20 : 0),
                        child: IgnorePointer(
                          ignoring: true,
                          child: Text(
                            MyStrings.coverLetter.label,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: MyDimentions.textSizeTitleSmall.size,
                            ),
                          ),
                        ),
                      ).animate().fade(
                            delay: const Duration(milliseconds: 400),
                            duration: const Duration(milliseconds: 400),
                          ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 64),
                          if (!context.isDesktop)
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Text(
                                "Experience",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: MyDimentions.textSizeTitleMedium.size,
                                ),
                              ),
                            ),
                          JobItemWidget(
                            key: _firstExpKey,
                            job: JobModel.jobs.first,
                          ),
                          ...JobModel.jobs.sublist(1).map(
                                (e) => JobItemWidget(
                                  job: e,
                                ),
                              ),
                          const SizedBox(height: 64),
                          if (!context.isDesktop)
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Text(
                                "Education",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: MyDimentions.textSizeTitleMedium.size,
                                ),
                              ),
                            ),
                          EducationItemWidget(
                            key: _firstEduKey,
                            education: EducationModel.educations.first,
                          ),
                          ...EducationModel.educations.sublist(1).map(
                                (e) => EducationItemWidget(
                                  education: e,
                                ),
                              ),
                          const SizedBox(height: 64),
                          if (!context.isDesktop)
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Text(
                                "Articles",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: MyDimentions.textSizeTitleMedium.size,
                                ),
                              ),
                            ),
                          ArticleItemWidget(
                            key: _firstArticleKey,
                            article: ArticleModel.articles.first,
                          ),
                          ...ArticleModel.articles.sublist(1).map(
                                (e) => ArticleItemWidget(
                                  article: e,
                                ),
                              ),
                          const SizedBox(height: 64),
                          if (!context.isDesktop)
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Text(
                                "Projects",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: MyDimentions.textSizeTitleMedium.size,
                                ),
                              ),
                            ),
                          ProjectItemWidget(
                            key: _firstProjectKey,
                            project: ProjectModel.projects.first,
                          ),
                          ...ProjectModel.projects.sublist(1).map(
                                (e) => ProjectItemWidget(
                                  project: e,
                                ),
                              ),
                          const SizedBox(height: 200),
                        ],
                      ).animate().moveY(begin: -200, delay: const Duration(seconds: 1), duration: const Duration(milliseconds: 300)).fade(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (context.isDesktop) const HeaderInfo(),
        ],
      ),
    );
  }
}

class HeaderInfo extends StatelessWidget {
  const HeaderInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * (context.isDesktop ? 0.3 : 1),
      margin: EdgeInsets.symmetric(vertical: MediaQuery.sizeOf(context).height * 0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PersonlInformation(),
          if (context.isDesktop) ...[
            const Spacer(),
            const PortfolioSections().animate().fade(
                  delay: const Duration(milliseconds: 400),
                  duration: const Duration(milliseconds: 400),
                ),
            const Spacer(),
            const Spacer(),
          ],
          const SocialsWidget().animate().fade(delay: const Duration(milliseconds: 300)),
        ],
      ).seperated(const SizedBox(
        height: 16,
      )),
    );
  }
}

class PersonlInformation extends StatelessWidget {
  const PersonlInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          MyStrings.myName.label,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: MyDimentions.textSizeDisplaySmall.size,
          ),
        ).animate().moveX(delay: const Duration(milliseconds: 300), begin: -100).fade(),
        const SizedBox(height: 8),
        Text(
          MyStrings.profession.label,
          style: TextStyle(
            color: Colors.white,
            fontSize: MyDimentions.textSizeTitleSmall.size,
          ),
        ).animate().moveX(delay: const Duration(milliseconds: 400), begin: -100).fade(),
        const SizedBox(height: 16),
        Text(
          MyStrings.jopSummery.label,
          style: TextStyle(
            color: Colors.grey,
            fontSize: MyDimentions.textSizeTitleSmall.size,
          ),
        ).animate().moveX(delay: const Duration(milliseconds: 500), begin: -100).fade(),
        const Padding(
          padding: EdgeInsets.only(right: 100, top: 8, bottom: 8),
          child: Divider(),
        ),
        Row(
          children: [
            const Icon(
              Icons.location_city,
              color: Colors.grey,
              size: 16,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              "Budapest, Hungary",
              style: TextStyle(
                color: Colors.grey,
                fontSize: MyDimentions.textSizeLabelLarge.size,
              ),
            ),
          ],
        ).animate().moveX(delay: const Duration(milliseconds: 600), begin: -100).fade(),
        const SizedBox(height: 4),
        InkWell(
          onTap: () {
            callPhoneNumber("+36205870460");
          },
          child: Row(
            children: [
              const Icon(
                Icons.phone,
                color: Colors.white,
                size: 16,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                "+36 20 587 0460",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: MyDimentions.textSizeLabelLarge.size,
                ),
              ),
            ],
          ),
        ).animate().moveX(delay: const Duration(milliseconds: 600), begin: -100).fade(),
      ],
    );
  }
}
