import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spacex_api/spacex_api.dart';

import '../providers/ships.dart';
import '../providers/launches.dart';
import 'package:code/utils/photos.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  SpaceXApi api = SpaceXApi();
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState

    Provider.of<Launches>(context, listen: false).fetchLaunches(api);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final launchData = Provider.of<Launches>(context, listen: false).items;
    return SingleChildScrollView(
      child: Column(children: [
        Container(
          height: 300,
          child: Swiper(
            itemCount: SpaceXPhotos.upcoming.length,
            itemBuilder: (context, i) {
              return Container(
                child: ClipRRect(
                    child: Image.network(
                  SpaceXPhotos.upcoming[i],
                  fit: BoxFit.cover,
                )),
              );
            },
            curve: Curves.easeInOutCubic,
            autoplay: true,
            autoplayDelay: 5000,
            duration: 850,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
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
        ),
      ]),
    );
  }
}
