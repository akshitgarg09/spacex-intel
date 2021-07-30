// @dart=2.9

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/upcoming_launches.dart';
import 'providers/ships.dart';
import 'providers/launches.dart';
import 'launch_item.dart';
import 'screens/home_screen.dart';
import 'screens/tabs_screen.dart';
import 'screens/latest_launches.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Ships()),
        ChangeNotifierProvider(create: (_) => Launches())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TabsScreen(),
        routes: {
          //LaunchItem.routeName: (ctx) => LaunchItem(),
        },
      ),
    );
  }
}
