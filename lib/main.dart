import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fooody/custom_color_scheme.dart';
import 'package:fooody/screens/Home.dart';
import 'package:fooody/screens/food.dart';
import 'package:fooody/screens/restaurant.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fooody',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color(0xFFFB6D3B),
          primarySwatch: Colors.blue,
          canvasColor: CustomColorScheme(Theme.of(context).colorScheme).light,
          textTheme: TextTheme(
            subhead: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              letterSpacing: 0.6,
            ),
            caption: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'Nunito',
              fontSize: 18,
            ),
          )),
      home: Home(),
      routes: {
        FoodScreen.routeName: (ctx) => FoodScreen(),
        Home.routeName: (ctx) => Home(),
        RestaurantScreen.routeName: (ctx) => RestaurantScreen(),
      },
    );
  }
}
