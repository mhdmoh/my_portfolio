import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

extension ContextEx on BuildContext {
  bool get isLandscape => MediaQuery.orientationOf(this) == Orientation.landscape;
  bool get isPortrait => MediaQuery.orientationOf(this) == Orientation.portrait;
  bool get isMobile => getDeviceType(MediaQuery.sizeOf(this)) == DeviceScreenType.mobile;
  bool get isNotMobile => getDeviceType(MediaQuery.sizeOf(this)) != DeviceScreenType.mobile;
  bool get isDesktop => getDeviceType(MediaQuery.sizeOf(this)) == DeviceScreenType.desktop;
}

extension ColorExt on Color {
  ColorFilter get filter => ColorFilter.mode(this, BlendMode.srcIn);
}

extension SeperatedColumn on Column {
  Column seperated(Widget seperator) {
    List<Widget> result = [];
    for (var child in children) {
      result.add(child);
      if (child != children.last) {
        result.add(seperator);
      }
    }
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: result,
    );
  }
}

extension SeperatedRow on Row {
  Row seperated(Widget seperator) {
    List<Widget> result = [];
    for (var child in children) {
      result.add(child);
      if (child != children.last) {
        result.add(seperator);
      }
    }
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: result,
    );
  }
}
