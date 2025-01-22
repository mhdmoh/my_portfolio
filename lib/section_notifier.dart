import 'package:flutter/material.dart';

enum Sections {
  about,
  experience,
  education,
  articles,
  projects,
}

class SectionNotifier {
  ///this will change automatically when scrolling
  static ValueNotifier<Sections> selectedSection = ValueNotifier<Sections>(Sections.about);

  ///this is used when manually clicking on a section title
  static ValueNotifier<Sections?> forceUpdate = ValueNotifier<Sections?>(null);
}
