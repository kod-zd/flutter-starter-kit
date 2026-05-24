import 'package:flutter/material.dart';

import 'utils/router.dart';
import 'utils/styles.dart';
import 'views/pages/unknown_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ZIO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Styles.appPrimaryColor,
        accentColor: Styles.appAccentColor,
        brightness: Brightness.light,
        canvasColor: Styles.appCanvasColor,
        fontFamily: 'Montserrat',
        textTheme: Styles.appTextTheme,
      ),

      // 👇 هذا أهم شيء
      initialRoute: '/zio',

      routes: appRoutes,

      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (BuildContext context) => UnknownPage(),
        );
      },
    );
  }
}
