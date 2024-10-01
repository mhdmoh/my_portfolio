import 'dart:convert';

import 'package:flutter/services.dart';

class EducationModel {
  final String from;
  final String to;
  final String name;
  final String institution;
  final String? website;

  EducationModel({
    required this.from,
    required this.to,
    required this.name,
    required this.institution,
    required this.website,
  });
  factory EducationModel.fromJson(Map<String, dynamic> json) {
    return EducationModel(
      from: json['from'],
      to: json['to'],
      name: json['name'],
      institution: json['institution'],
      website: json['website'],
    );
  }

  static Future<void> loadEducationsFromJson() async {
    String jsonString = await rootBundle.loadString('assets/data/education.json');
    List<dynamic> jsonData = json.decode(jsonString);
    educations = jsonData.map((edu) => EducationModel.fromJson(edu)).toList();
  }

  static List<EducationModel> educations = [];
}
