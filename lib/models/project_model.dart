import 'dart:convert';

import 'package:flutter/services.dart';

class ProjectModel {
  final String projectName;
  final String? companyName;
  final String? imagePath;
  final String description;
  final List<String>? tags;
  final String? link;
  final String? iosLink;
  final String? androidLink;

  ProjectModel({
    required this.projectName,
    this.companyName,
    this.imagePath,
    required this.description,
    this.tags,
    this.link,
    this.iosLink,
    this.androidLink,
  });
  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      projectName: json['projectName'],
      companyName: json['companyName'],
      imagePath: json['imagePath'],
      description: json['description'],
      link: json['link'],
      tags: json['tags'] != null ? List<String>.from(json['tags']) : null,
      androidLink: json['androidLink'],
      iosLink: json['iosLink'],
    );
  }

  static Future<void> loadProjectsFromJson() async {
    String jsonString = await rootBundle.loadString('assets/data/projects.json');
    List<dynamic> jsonData = json.decode(jsonString);
    projects = jsonData.map((project) => ProjectModel.fromJson(project)).toList();
  }

  static List<ProjectModel> projects = [];
}
