import 'package:flutter/material.dart';
import 'package:my_portfolio/config/colors.dart';
import 'package:my_portfolio/dashboard_page.dart';
import 'package:my_portfolio/models/article_model.dart';
import 'package:my_portfolio/models/education_model.dart';
import 'package:my_portfolio/models/job_model.dart';
import 'package:my_portfolio/models/project_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    JobModel.loadJobsFromJson(),
    EducationModel.loadEducationsFromJson(),
    ProjectModel.loadProjectsFromJson(),
    ArticleModel.loadArticlesFromJson(),
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mohamad Mohamad',
      theme: ThemeData(
        scaffoldBackgroundColor: MyColors.primary.color,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DashboardPage(),
    );
  }
}
