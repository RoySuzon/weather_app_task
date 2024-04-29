import 'package:hive/hive.dart';

class HiveBoxs {
  static Box<dynamic> get currentWeather => Hive.box("currentWeather");
  static Box<dynamic> get forCast => Hive.box("forCast");
}

Future<void> initBox() async {
  await Hive.openBox<dynamic>("currentWeather");
  await Hive.openBox<dynamic>("forCast");
}
