import 'package:hive/hive.dart';

class HiveBoxs {
 static Future<void> initBox() async {
    await Hive.openBox<dynamic>("currentWeather");
    await Hive.openBox<dynamic>("forCast");
  }

  static Box<dynamic> get currentWeatherBox => Hive.box("currentWeather");
  static Box<dynamic> get forCastBox => Hive.box("forCast");
}
