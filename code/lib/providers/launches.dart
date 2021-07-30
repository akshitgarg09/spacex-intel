import 'package:code/screens/latest_launches.dart';
import 'package:spacex_api/spacex_api.dart';
import 'package:spacex_api/models/launch/launch.dart';
import 'package:spacex_api/models/starlink/starlink.dart';
import 'package:spacex_api/models/pagenated_response.dart';
import 'package:spacex_api/models/query/options.dart';
import 'package:spacex_api/utils.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:code/models/my_launch.dart';

class Launches with ChangeNotifier {
  List<MyLaunch> _items = [];

  List<MyLaunch> get items {
    List<MyLaunch> upL = _items.where((element) => element.isUpcoming).toList();
    upL.sort((a, b) => a.flightNo.compareTo(b.flightNo));

    return upL;
  }

  List<MyLaunch> get latestLaunches {
    List<MyLaunch> latL =
        _items.where((element) => !element.isUpcoming).toList();
    latL.sort((a, b) => b.flightNo.compareTo(a.flightNo));
    return latL;
  }

  _parseResponse(Response response) {
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return jsonResponse;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  Future<void> fetchLaunches(SpaceXApi api) async {
    final response = await api.getAllLaunches();
    final json = _parseResponse(response);
    if (json != null) {
      List<Launch> data =
          json.map((e) => Launch.fromJson(e)).cast<Launch>().toList();
      print("Fetch Launch ${data[0].details}");

      final List<MyLaunch> loadedLaunches = [];
      data.forEach((element) {
        loadedLaunches.add(MyLaunch(
            name: element.name,
            date: element.dateLocal,
            isUpcoming: element.upcoming,
            flightNo: element.flightNumber.toInt()));
      });
      _items = loadedLaunches;
      notifyListeners();
    }
  }
}
