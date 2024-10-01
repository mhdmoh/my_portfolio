import 'dart:convert';

import 'package:flutter/services.dart';

class JobModel {
  final String start;
  final String end;
  final String company;
  final String? website;
  final String title;
  final String description;

  final List<String> tags;

  JobModel({
    required this.start,
    required this.end,
    required this.company,
    this.website,
    required this.title,
    required this.description,
    required this.tags,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      start: json['start'],
      end: json['end'],
      company: json['company'],
      website: json['website'],
      title: json['title'],
      description: json['description'],
      tags: List<String>.from(json['tags']),
    );
  }
  static Future<void> loadJobsFromJson() async {
    String jsonString = await rootBundle.loadString('assets/data/jobs.json');
    List<dynamic> jsonData = json.decode(jsonString);
    jobs = jsonData.map((job) => JobModel.fromJson(job)).toList();
  }

  static List<JobModel> jobs = [];
}
