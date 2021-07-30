import 'package:flutter/material.dart';
import 'package:spacex_api/spacex_api.dart';
import 'package:provider/provider.dart';

import 'package:code/providers/launches.dart';

class LatestLaunches extends StatefulWidget {
  static const routeName = '/LatestLaunches';
  const LatestLaunches({Key? key}) : super(key: key);

  @override
  _LatestLaunchesState createState() => _LatestLaunchesState();
}

class _LatestLaunchesState extends State<LatestLaunches> {
  @override
  SpaceXApi api = SpaceXApi();

  @override
  void initState() {
    // TODO: implement initState

    Provider.of<Launches>(context, listen: false).fetchLaunches(api);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final launchData =
        Provider.of<Launches>(context, listen: false).latestLaunches;
    return ListView.builder(
      itemBuilder: (ctx, i) {
        return Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(launchData[i].name),
                    Text(launchData[i].flightNo.toString())
                  ]),
              Divider()
            ],
          ),
        );
      },
      itemCount: launchData.length,
    );
  }
}
