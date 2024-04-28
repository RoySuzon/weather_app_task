import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_app_task/app/local/hive_boxes.dart';
import 'package:weather_app_task/app/presentations/pages/home/home_screen.dart';

void main() async {
  runApp(const MyApp());
  await Hive.initFlutter();
  await HiveBoxs.initBox();
  // await Hive.openBox("currentWeather");
  //   await Hive.openBox("forCast");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xff97ABFF),
        colorScheme: ColorScheme.fromSeed(
            brightness: Brightness.dark, seedColor: const Color(0xff97ABFF)),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
