import 'dart:convert';

ForcastModel forcastModelFromJson(String str) =>
    ForcastModel.fromJson(json.decode(str));

String forcastModelToJson(ForcastModel data) => json.encode(data.toJson());

class ForcastModel {
  Location? location;
  Current? current;
  Forecast? forecast;

  ForcastModel({this.location, this.current, this.forecast});

  ForcastModel.fromJson(Map<String, dynamic> json) {
    if (json["location"] is Map) {
      location =
          json["location"] == null ? null : Location.fromJson(json["location"]);
    }
    if (json["current"] is Map) {
      current =
          json["current"] == null ? null : Current.fromJson(json["current"]);
    }
    if (json["forecast"] is Map) {
      forecast =
          json["forecast"] == null ? null : Forecast.fromJson(json["forecast"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (location != null) {
      data["location"] = location?.toJson();
    }
    if (current != null) {
      data["current"] = current?.toJson();
    }
    if (forecast != null) {
      data["forecast"] = forecast?.toJson();
    }
    return data;
  }
}

class Forecast {
  List<Forecastday>? forecastday;

  Forecast({this.forecastday});

  Forecast.fromJson(Map<String, dynamic> json) {
    if (json["forecastday"] is List) {
      forecastday = json["forecastday"] == null
          ? null
          : (json["forecastday"] as List)
              .map((e) => Forecastday.fromJson(e))
              .toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (forecastday != null) {
      data["forecastday"] = forecastday?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Forecastday {
  String? date;
  double? dateEpoch;
  Day? day;
  Astro? astro;
  List<Hour>? hour;

  Forecastday({this.date, this.dateEpoch, this.day, this.astro, this.hour});

  Forecastday.fromJson(Map<String, dynamic> json) {
    if (json["date"] is String) {
      date = json["date"];
    }
    if (json["date_epoch"] is double) {
      dateEpoch = json["date_epoch"];
    }
    if (json["day"] is Map) {
      day = json["day"] == null ? null : Day.fromJson(json["day"]);
    }
    if (json["astro"] is Map) {
      astro = json["astro"] == null ? null : Astro.fromJson(json["astro"]);
    }
    if (json["hour"] is List) {
      hour = json["hour"] == null
          ? null
          : (json["hour"] as List).map((e) => Hour.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["date"] = date;
    data["date_epoch"] = dateEpoch;
    if (day != null) {
      data["day"] = day?.toJson();
    }
    if (astro != null) {
      data["astro"] = astro?.toJson();
    }
    if (hour != null) {
      data["hour"] = hour?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Hour {
  double? timeEpoch;
  String? time;
  double? tempC;
  double? tempF;
  double? isDay;
  Condition2? condition;
  double? windMph;
  double? windKph;
  double? windDegree;
  String? windDir;
  double? pressureMb;
  double? pressureIn;
  double? precipMm;
  double? precipIn;
  double? snowCm;
  double? humidity;
  double? cloud;
  double? feelslikeC;
  double? feelslikeF;
  double? windchillC;
  double? windchillF;
  double? heatindexC;
  double? heatindexF;
  double? dewpointC;
  double? dewpointF;
  double? willItRain;
  double? chanceOfRain;
  double? willItSnow;
  double? chanceOfSnow;
  double? visKm;
  int? visMiles;
  double? gustMph;
  double? gustKph;
  int? uv;

  Hour(
      {this.timeEpoch,
      this.time,
      this.tempC,
      this.tempF,
      this.isDay,
      this.condition,
      this.windMph,
      this.windKph,
      this.windDegree,
      this.windDir,
      this.pressureMb,
      this.pressureIn,
      this.precipMm,
      this.precipIn,
      this.snowCm,
      this.humidity,
      this.cloud,
      this.feelslikeC,
      this.feelslikeF,
      this.windchillC,
      this.windchillF,
      this.heatindexC,
      this.heatindexF,
      this.dewpointC,
      this.dewpointF,
      this.willItRain,
      this.chanceOfRain,
      this.willItSnow,
      this.chanceOfSnow,
      this.visKm,
      this.visMiles,
      this.gustMph,
      this.gustKph,
      this.uv});

  Hour.fromJson(Map<String, dynamic> json) {
    if (json["time_epoch"] is double) {
      timeEpoch = json["time_epoch"];
    }
    if (json["time"] is String) {
      time = json["time"];
    }
    if (json["temp_c"] is double) {
      tempC = json["temp_c"];
    }
    if (json["temp_f"] is double) {
      tempF = json["temp_f"];
    }
    if (json["is_day"] is double) {
      isDay = json["is_day"];
    }
    if (json["condition"] is Map) {
      condition = json["condition"] == null
          ? null
          : Condition2.fromJson(json["condition"]);
    }
    if (json["wind_mph"] is double) {
      windMph = json["wind_mph"];
    }
    if (json["wind_kph"] is double) {
      windKph = json["wind_kph"];
    }
    if (json["wind_degree"] is double) {
      windDegree = json["wind_degree"];
    }
    if (json["wind_dir"] is String) {
      windDir = json["wind_dir"];
    }
    if (json["pressure_mb"] is double) {
      pressureMb = json["pressure_mb"];
    }
    if (json["pressure_in"] is double) {
      pressureIn = json["pressure_in"];
    }
    if (json["precip_mm"] is double) {
      precipMm = json["precip_mm"];
    }
    if (json["precip_in"] is double) {
      precipIn = json["precip_in"];
    }
    if (json["snow_cm"] is double) {
      snowCm = json["snow_cm"];
    }
    if (json["humidity"] is double) {
      humidity = json["humidity"];
    }
    if (json["cloud"] is double) {
      cloud = json["cloud"];
    }
    if (json["feelslike_c"] is double) {
      feelslikeC = json["feelslike_c"];
    }
    if (json["feelslike_f"] is double) {
      feelslikeF = json["feelslike_f"];
    }
    if (json["windchill_c"] is double) {
      windchillC = json["windchill_c"];
    }
    if (json["windchill_f"] is double) {
      windchillF = json["windchill_f"];
    }
    if (json["heatindex_c"] is double) {
      heatindexC = json["heatindex_c"];
    }
    if (json["heatindex_f"] is double) {
      heatindexF = json["heatindex_f"];
    }
    if (json["dewpoint_c"] is double) {
      dewpointC = json["dewpoint_c"];
    }
    if (json["dewpoint_f"] is double) {
      dewpointF = json["dewpoint_f"];
    }
    if (json["will_it_rain"] is double) {
      willItRain = json["will_it_rain"];
    }
    if (json["chance_of_rain"] is double) {
      chanceOfRain = json["chance_of_rain"];
    }
    if (json["will_it_snow"] is double) {
      willItSnow = json["will_it_snow"];
    }
    if (json["chance_of_snow"] is double) {
      chanceOfSnow = json["chance_of_snow"];
    }
    if (json["vis_km"] is double) {
      visKm = json["vis_km"];
    }
    if (json["vis_miles"] is int) {
      visMiles = json["vis_miles"];
    }
    if (json["gust_mph"] is double) {
      gustMph = json["gust_mph"];
    }
    if (json["gust_kph"] is double) {
      gustKph = json["gust_kph"];
    }
    if (json["uv"] is int) {
      uv = json["uv"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["time_epoch"] = timeEpoch;
    data["time"] = time;
    data["temp_c"] = tempC;
    data["temp_f"] = tempF;
    data["is_day"] = isDay;
    if (condition != null) {
      data["condition"] = condition?.toJson();
    }
    data["wind_mph"] = windMph;
    data["wind_kph"] = windKph;
    data["wind_degree"] = windDegree;
    data["wind_dir"] = windDir;
    data["pressure_mb"] = pressureMb;
    data["pressure_in"] = pressureIn;
    data["precip_mm"] = precipMm;
    data["precip_in"] = precipIn;
    data["snow_cm"] = snowCm;
    data["humidity"] = humidity;
    data["cloud"] = cloud;
    data["feelslike_c"] = feelslikeC;
    data["feelslike_f"] = feelslikeF;
    data["windchill_c"] = windchillC;
    data["windchill_f"] = windchillF;
    data["heatindex_c"] = heatindexC;
    data["heatindex_f"] = heatindexF;
    data["dewpoint_c"] = dewpointC;
    data["dewpoint_f"] = dewpointF;
    data["will_it_rain"] = willItRain;
    data["chance_of_rain"] = chanceOfRain;
    data["will_it_snow"] = willItSnow;
    data["chance_of_snow"] = chanceOfSnow;
    data["vis_km"] = visKm;
    data["vis_miles"] = visMiles;
    data["gust_mph"] = gustMph;
    data["gust_kph"] = gustKph;
    data["uv"] = uv;
    return data;
  }
}

class Condition2 {
  String? text;
  String? icon;
  double? code;

  Condition2({this.text, this.icon, this.code});

  Condition2.fromJson(Map<String, dynamic> json) {
    if (json["text"] is String) {
      text = json["text"];
    }
    if (json["icon"] is String) {
      icon = json["icon"];
    }
    if (json["code"] is double) {
      code = json["code"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["text"] = text;
    data["icon"] = icon;
    data["code"] = code;
    return data;
  }
}

class Astro {
  String? sunrise;
  String? sunset;
  String? moonrise;
  String? moonset;
  String? moonPhase;
  double? moonIllumination;
  double? isMoonUp;
  double? isSunUp;

  Astro(
      {this.sunrise,
      this.sunset,
      this.moonrise,
      this.moonset,
      this.moonPhase,
      this.moonIllumination,
      this.isMoonUp,
      this.isSunUp});

  Astro.fromJson(Map<String, dynamic> json) {
    if (json["sunrise"] is String) {
      sunrise = json["sunrise"];
    }
    if (json["sunset"] is String) {
      sunset = json["sunset"];
    }
    if (json["moonrise"] is String) {
      moonrise = json["moonrise"];
    }
    if (json["moonset"] is String) {
      moonset = json["moonset"];
    }
    if (json["moon_phase"] is String) {
      moonPhase = json["moon_phase"];
    }
    if (json["moon_illumination"] is double) {
      moonIllumination = json["moon_illumination"];
    }
    if (json["is_moon_up"] is double) {
      isMoonUp = json["is_moon_up"];
    }
    if (json["is_sun_up"] is double) {
      isSunUp = json["is_sun_up"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["sunrise"] = sunrise;
    data["sunset"] = sunset;
    data["moonrise"] = moonrise;
    data["moonset"] = moonset;
    data["moon_phase"] = moonPhase;
    data["moon_illumination"] = moonIllumination;
    data["is_moon_up"] = isMoonUp;
    data["is_sun_up"] = isSunUp;
    return data;
  }
}

class Day {
  double? maxtempC;
  double? maxtempF;
  double? mintempC;
  double? mintempF;
  double? avgtempC;
  double? avgtempF;
  double? maxwindMph;
  double? maxwindKph;
  double? totalprecipMm;
  double? totalprecipIn;
  double? totalsnowCm;
  double? avgvisKm;
  double? avgvisMiles;
  double? avghumidity;
  double? dailyWillItRain;
  double? dailyChanceOfRain;
  double? dailyWillItSnow;
  double? dailyChanceOfSnow;
  Condition1? condition;
  double? uv;

  Day(
      {this.maxtempC,
      this.maxtempF,
      this.mintempC,
      this.mintempF,
      this.avgtempC,
      this.avgtempF,
      this.maxwindMph,
      this.maxwindKph,
      this.totalprecipMm,
      this.totalprecipIn,
      this.totalsnowCm,
      this.avgvisKm,
      this.avgvisMiles,
      this.avghumidity,
      this.dailyWillItRain,
      this.dailyChanceOfRain,
      this.dailyWillItSnow,
      this.dailyChanceOfSnow,
      this.condition,
      this.uv});

  Day.fromJson(Map<String, dynamic> json) {
    if (json["maxtemp_c"] is double) {
      maxtempC = json["maxtemp_c"];
    }
    if (json["maxtemp_f"] is double) {
      maxtempF = json["maxtemp_f"];
    }
    if (json["mintemp_c"] is double) {
      mintempC = json["mintemp_c"];
    }
    if (json["mintemp_f"] is double) {
      mintempF = json["mintemp_f"];
    }
    if (json["avgtemp_c"] is double) {
      avgtempC = json["avgtemp_c"];
    }
    if (json["avgtemp_f"] is double) {
      avgtempF = json["avgtemp_f"];
    }
    if (json["maxwind_mph"] is double) {
      maxwindMph = json["maxwind_mph"];
    }
    if (json["maxwind_kph"] is double) {
      maxwindKph = json["maxwind_kph"];
    }
    if (json["totalprecip_mm"] is double) {
      totalprecipMm = json["totalprecip_mm"];
    }
    if (json["totalprecip_in"] is double) {
      totalprecipIn = json["totalprecip_in"];
    }
    if (json["totalsnow_cm"] is double) {
      totalsnowCm = json["totalsnow_cm"];
    }
    if (json["avgvis_km"] is double) {
      avgvisKm = json["avgvis_km"];
    }
    if (json["avgvis_miles"] is double) {
      avgvisMiles = json["avgvis_miles"];
    }
    if (json["avghumidity"] is double) {
      avghumidity = json["avghumidity"];
    }
    if (json["daily_will_it_rain"] is double) {
      dailyWillItRain = json["daily_will_it_rain"];
    }
    if (json["daily_chance_of_rain"] is double) {
      dailyChanceOfRain = json["daily_chance_of_rain"];
    }
    if (json["daily_will_it_snow"] is double) {
      dailyWillItSnow = json["daily_will_it_snow"];
    }
    if (json["daily_chance_of_snow"] is double) {
      dailyChanceOfSnow = json["daily_chance_of_snow"];
    }
    if (json["condition"] is Map) {
      condition = json["condition"] == null
          ? null
          : Condition1.fromJson(json["condition"]);
    }
    if (json["uv"] is double) {
      uv = json["uv"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["maxtemp_c"] = maxtempC;
    data["maxtemp_f"] = maxtempF;
    data["mintemp_c"] = mintempC;
    data["mintemp_f"] = mintempF;
    data["avgtemp_c"] = avgtempC;
    data["avgtemp_f"] = avgtempF;
    data["maxwind_mph"] = maxwindMph;
    data["maxwind_kph"] = maxwindKph;
    data["totalprecip_mm"] = totalprecipMm;
    data["totalprecip_in"] = totalprecipIn;
    data["totalsnow_cm"] = totalsnowCm;
    data["avgvis_km"] = avgvisKm;
    data["avgvis_miles"] = avgvisMiles;
    data["avghumidity"] = avghumidity;
    data["daily_will_it_rain"] = dailyWillItRain;
    data["daily_chance_of_rain"] = dailyChanceOfRain;
    data["daily_will_it_snow"] = dailyWillItSnow;
    data["daily_chance_of_snow"] = dailyChanceOfSnow;
    if (condition != null) {
      data["condition"] = condition?.toJson();
    }
    data["uv"] = uv;
    return data;
  }
}

class Condition1 {
  String? text;
  String? icon;
  double? code;

  Condition1({this.text, this.icon, this.code});

  Condition1.fromJson(Map<String, dynamic> json) {
    if (json["text"] is String) {
      text = json["text"];
    }
    if (json["icon"] is String) {
      icon = json["icon"];
    }
    if (json["code"] is double) {
      code = json["code"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["text"] = text;
    data["icon"] = icon;
    data["code"] = code;
    return data;
  }
}

class Current {
  double? lastUpdatedEpoch;
  String? lastUpdated;
  double? tempC;
  double? tempF;
  double? isDay;
  Condition? condition;
  double? windMph;
  double? windKph;
  int? windDegree;
  String? windDir;
  int? pressureMb;
  double? pressureIn;
  double? precipMm;
  double? precipIn;
  double? humidity;
  double? cloud;
  double? feelslikeC;
  double? feelslikeF;
  double? visKm;
  double? visMiles;
  double? uv;
  double? gustMph;
  double? gustKph;

  Current(
      {this.lastUpdatedEpoch,
      this.lastUpdated,
      this.tempC,
      this.tempF,
      this.isDay,
      this.condition,
      this.windMph,
      this.windKph,
      this.windDegree,
      this.windDir,
      this.pressureMb,
      this.pressureIn,
      this.precipMm,
      this.precipIn,
      this.humidity,
      this.cloud,
      this.feelslikeC,
      this.feelslikeF,
      this.visKm,
      this.visMiles,
      this.uv,
      this.gustMph,
      this.gustKph});

  Current.fromJson(Map<String, dynamic> json) {
    if (json["last_updated_epoch"] is double) {
      lastUpdatedEpoch = json["last_updated_epoch"];
    }
    if (json["last_updated"] is String) {
      lastUpdated = json["last_updated"];
    }
    if (json["temp_c"] is double) {
      tempC = json["temp_c"];
    }
    if (json["temp_f"] is double) {
      tempF = json["temp_f"];
    }
    if (json["is_day"] is double) {
      isDay = json["is_day"];
    }
    if (json["condition"] is Map) {
      condition = json["condition"] == null
          ? null
          : Condition.fromJson(json["condition"]);
    }
    if (json["wind_mph"] is double) {
      windMph = json["wind_mph"];
    }
    if (json["wind_kph"] is double) {
      windKph = json["wind_kph"];
    }
    if (json["wind_degree"] is int) {
      windDegree = json["wind_degree"];
    }
    if (json["wind_dir"] is String) {
      windDir = json["wind_dir"];
    }
    if (json["pressure_mb"] is int) {
      pressureMb = json["pressure_mb"];
    }
    if (json["pressure_in"] is double) {
      pressureIn = json["pressure_in"];
    }
    if (json["precip_mm"] is double) {
      precipMm = json["precip_mm"];
    }
    if (json["precip_in"] is double) {
      precipIn = json["precip_in"];
    }
    if (json["humidity"] is double) {
      humidity = json["humidity"];
    }
    if (json["cloud"] is double) {
      cloud = json["cloud"];
    }
    if (json["feelslike_c"] is double) {
      feelslikeC = json["feelslike_c"];
    }
    if (json["feelslike_f"] is double) {
      feelslikeF = json["feelslike_f"];
    }
    if (json["vis_km"] is double) {
      visKm = json["vis_km"];
    }
    if (json["vis_miles"] is double) {
      visMiles = json["vis_miles"];
    }
    if (json["uv"] is double) {
      uv = json["uv"];
    }
    if (json["gust_mph"] is double) {
      gustMph = json["gust_mph"];
    }
    if (json["gust_kph"] is double) {
      gustKph = json["gust_kph"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["last_updated_epoch"] = lastUpdatedEpoch;
    data["last_updated"] = lastUpdated;
    data["temp_c"] = tempC;
    data["temp_f"] = tempF;
    data["is_day"] = isDay;
    if (condition != null) {
      data["condition"] = condition?.toJson();
    }
    data["wind_mph"] = windMph;
    data["wind_kph"] = windKph;
    data["wind_degree"] = windDegree;
    data["wind_dir"] = windDir;
    data["pressure_mb"] = pressureMb;
    data["pressure_in"] = pressureIn;
    data["precip_mm"] = precipMm;
    data["precip_in"] = precipIn;
    data["humidity"] = humidity;
    data["cloud"] = cloud;
    data["feelslike_c"] = feelslikeC;
    data["feelslike_f"] = feelslikeF;
    data["vis_km"] = visKm;
    data["vis_miles"] = visMiles;
    data["uv"] = uv;
    data["gust_mph"] = gustMph;
    data["gust_kph"] = gustKph;
    return data;
  }
}

class Condition {
  String? text;
  String? icon;
  double? code;

  Condition({this.text, this.icon, this.code});

  Condition.fromJson(Map<String, dynamic> json) {
    if (json["text"] is String) {
      text = json["text"];
    }
    if (json["icon"] is String) {
      icon = json["icon"];
    }
    if (json["code"] is double) {
      code = json["code"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["text"] = text;
    data["icon"] = icon;
    data["code"] = code;
    return data;
  }
}

class Location {
  String? name;
  String? region;
  String? country;
  double? lat;
  double? lon;
  String? tzId;
  double? localtimeEpoch;
  String? localtime;

  Location(
      {this.name,
      this.region,
      this.country,
      this.lat,
      this.lon,
      this.tzId,
      this.localtimeEpoch,
      this.localtime});

  Location.fromJson(Map<String, dynamic> json) {
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["region"] is String) {
      region = json["region"];
    }
    if (json["country"] is String) {
      country = json["country"];
    }
    if (json["lat"] is double) {
      lat = json["lat"];
    }
    if (json["lon"] is double) {
      lon = json["lon"];
    }
    if (json["tz_id"] is String) {
      tzId = json["tz_id"];
    }
    if (json["localtime_epoch"] is double) {
      localtimeEpoch = json["localtime_epoch"];
    }
    if (json["localtime"] is String) {
      localtime = json["localtime"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["region"] = region;
    data["country"] = country;
    data["lat"] = lat;
    data["lon"] = lon;
    data["tz_id"] = tzId;
    data["localtime_epoch"] = localtimeEpoch;
    data["localtime"] = localtime;
    return data;
  }
}
