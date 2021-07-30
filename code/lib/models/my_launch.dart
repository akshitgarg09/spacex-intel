import 'dart:convert';
import 'package:flutter/foundation.dart';

class MyLaunch {
  final String name;
  final String date;
  final int flightNo;
  bool isUpcoming;

  MyLaunch(
      {required this.name,
      required this.date,
      required this.flightNo,
      this.isUpcoming = false});
}
