import 'package:flutter/material.dart';
import 'package:thebrandassignment/model/constants.dart';
import 'package:thebrandassignment/model/size_config.dart';
import 'package:thebrandassignment/view/bottom_nav.dart';
import 'package:thebrandassignment/view/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);

        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Sacco App',
            theme: ThemeData(primaryColor: teal, fontFamily: 'OpenSans'),
            initialRoute: '/bottom_nav',
            routes: <String, WidgetBuilder>{
              '/home': (context) => Home(),
              '/bottom_nav': (context) => BottomNav(),
            });
      });
    });
  }
}