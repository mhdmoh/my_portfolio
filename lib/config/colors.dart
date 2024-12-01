import 'package:flutter/material.dart';

enum MyColors {
  // primary(Color.fromARGB(255, 2, 34, 15)),
  // secondary(Colors.green),
  primary(Color(0xFF014035)),
  secondary(Color(0xff4caf50)),
  black(Color(0xff000000)),
  white(Color(0xffffffff));

  final Color color;

  const MyColors(this.color);
}
