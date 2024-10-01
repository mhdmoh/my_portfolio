import 'dart:math';

import 'package:flutter/material.dart';
import 'package:logger/web.dart';
import 'package:my_portfolio/config/extensions.dart';
import 'package:url_launcher/url_launcher.dart';

void plog(dynamic message) {
  Logger().d(message);
}

Future<void> openUrl(String url) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw Exception('Could not launch $url');
  }
}

void callPhoneNumber(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );

  if (await canLaunch(launchUri.toString())) {
    await launch(launchUri.toString());
  } else {
    throw 'Could not launch $launchUri';
  }
}

double degreesToRadians(double degrees) {
  return degrees * (pi / 180.0);
}

T deviceHandler<T>(BuildContext context, {required T tabletPortrait, T? tabletLandscape, required T mobilePortrait, T? mobileLandscape}) {
  final orientation = MediaQuery.orientationOf(context);

  if (context.isNotMobile) {
    if (orientation == Orientation.landscape && tabletLandscape != null) {
      return tabletLandscape;
    } else {
      return tabletPortrait;
    }
  } else {
    if (orientation == Orientation.landscape && mobileLandscape != null) {
      return mobileLandscape;
    } else {
      return mobilePortrait;
    }
  }
}
