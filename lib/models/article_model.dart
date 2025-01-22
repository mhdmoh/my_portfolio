import 'dart:convert';

import 'package:flutter/services.dart';

class ArticleModel {
  final String title;
  final String publishDate;
  final String summary;
  final String impact;
  final List<String> topics;
  final String link;

  ArticleModel({
    required this.title,
    required this.publishDate,
    required this.summary,
    required this.impact,
    required this.topics,
    required this.link,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      title: json['title'],
      publishDate: json['publish_date'],
      summary: json['summary'],
      impact: json['impact'],
      topics: List<String>.from(json['topics']),
      link: json['link'],
    );
  }

  static Future<void> loadArticlesFromJson() async {
    String jsonString = await rootBundle.loadString('assets/data/articles.json');
    List<dynamic> jsonData = json.decode(jsonString);
    articles = jsonData.map((edu) => ArticleModel.fromJson(edu)).toList();
  }

  static List<ArticleModel> articles = [];
}
