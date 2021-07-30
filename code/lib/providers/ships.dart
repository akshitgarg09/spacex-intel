import 'package:spacex_api/spacex_api.dart';
import 'package:spacex_api/models/starlink/starlink.dart';
import 'package:spacex_api/models/pagenated_response.dart';
import 'package:spacex_api/models/query/options.dart';
import 'package:spacex_api/utils.dart';
import 'package:http/http.dart';
import 'dart:convert' as convert;

import 'package:flutter/material.dart';

class Ships with ChangeNotifier {
  // Fetch all items
  Future<void> getAllStarlink(SpaceXApi api) async {
    final response = await api.getAllStarlinks();
    if (response.statusCode == 200) {
      List<Starlink> data = Utils.convertResponseToList<Starlink>(
          response, (e) => Starlink.fromJson(e));
      print("Fetch Starlinks ${data[0]}");
    }
  }

// Query items
  Future<void> queryStarlinks(SpaceXApi api) async {
    final query = Options();
    query.limit = 25;
    query.page = 1;
    query.pagination = true;
    query.select = [
      "version",
      "height_km",
      "longitude",
    ];
    var queryJson = convert.jsonEncode(query.toJson());

    final response = await api.queryStarlinks(query: queryJson);
    if (response.statusCode == 200) {
      final jsonResp = Utils.parseResponseAsJson(response);
      PagenatedResponse pagenatedResponse =
          PagenatedResponse.fromJson(jsonResp);
      List<Starlink> data = pagenatedResponse.docs
          .map((e) => Starlink.fromJson(e))
          .cast<Starlink>()
          .toList();
      print("Qeury Starlinks ${data.length}");
    }
  }
}
