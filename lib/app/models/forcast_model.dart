// // To parse this JSON data, do
// //
// //     final forcastModel = forcastModelFromJson(jsonString);

// import 'dart:convert';

// ForcastModel forcastModelFromJson(String str) => ForcastModel.fromJson(json.decode(str));

// String forcastModelToJson(ForcastModel data) => json.encode(data.toJson());

// class ForcastModel {
//     Location? location;
//     Current? current;
//     Forecast? forecast;

//     ForcastModel({
//         this.location,
//         this.current,
//         this.forecast,
//     });

//     factory ForcastModel.fromJson(Map<String, dynamic> json) => ForcastModel(
//         location: json["location"] == null ? null : Location.fromJson(json["location"]),
//         current: json["current"] == null ? null : Current.fromJson(json["current"]),
//         forecast: json["forecast"] == null ? null : Forecast.fromJson(json["forecast"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "location": location?.toJson(),
//         "current": current?.toJson(),
//         "forecast": forecast?.toJson(),
//     };
// }

// class Current {
//     double? lastUpdatedEpoch;
//     String? lastUpdated;
//     double? tempC;
//     double? tempF;
//     double? isDay;
//     Condition? condition;
//     double? windMph;
//     double? windKph;
//     int? windDegree;
//     String? windDir;
//     int? pressureMb;
//     double? pressureIn;
//     double? precipMm;
//     double? precipIn;
//     double? humidity;
//     double? cloud;
//     double? feelslikeC;
//     double? feelslikeF;
//     double? visKm;
//     double? visMiles;
//     double? uv;
//     double? gustMph;
//     double? gustKph;

//     Current({
//         this.lastUpdatedEpoch,
//         this.lastUpdated,
//         this.tempC,
//         this.tempF,
//         this.isDay,
//         this.condition,
//         this.windMph,
//         this.windKph,
//         this.windDegree,
//         this.windDir,
//         this.pressureMb,
//         this.pressureIn,
//         this.precipMm,
//         this.precipIn,
//         this.humidity,
//         this.cloud,
//         this.feelslikeC,
//         this.feelslikeF,
//         this.visKm,
//         this.visMiles,
//         this.uv,
//         this.gustMph,
//         this.gustKph,
//     });

//     factory Current.fromJson(Map<String, dynamic> json) => Current(
//         lastUpdatedEpoch: json["last_updated_epoch"]?.toDouble(),
//         lastUpdated: json["last_updated"],
//         tempC: json["temp_c"]?.toDouble(),
//         tempF: json["temp_f"]?.toDouble(),
//         isDay: json["is_day"]?.toDouble(),
//         condition: json["condition"] == null ? null : Condition.fromJson(json["condition"]),
//         windMph: json["wind_mph"]?.toDouble(),
//         windKph: json["wind_kph"]?.toDouble(),
//         windDegree: json["wind_degree"],
//         windDir: json["wind_dir"],
//         pressureMb: json["pressure_mb"],
//         pressureIn: json["pressure_in"]?.toDouble(),
//         precipMm: json["precip_mm"]?.toDouble(),
//         precipIn: json["precip_in"]?.toDouble(),
//         humidity: json["humidity"]?.toDouble(),
//         cloud: json["cloud"]?.toDouble(),
//         feelslikeC: json["feelslike_c"]?.toDouble(),
//         feelslikeF: json["feelslike_f"]?.toDouble(),
//         visKm: json["vis_km"]?.toDouble(),
//         visMiles: json["vis_miles"]?.toDouble(),
//         uv: json["uv"]?.toDouble(),
//         gustMph: json["gust_mph"]?.toDouble(),
//         gustKph: json["gust_kph"]?.toDouble(),
//     );

//     Map<String, dynamic> toJson() => {
//         "last_updated_epoch": lastUpdatedEpoch,
//         "last_updated": lastUpdated,
//         "temp_c": tempC,
//         "temp_f": tempF,
//         "is_day": isDay,
//         "condition": condition?.toJson(),
//         "wind_mph": windMph,
//         "wind_kph": windKph,
//         "wind_degree": windDegree,
//         "wind_dir": windDir,
//         "pressure_mb": pressureMb,
//         "pressure_in": pressureIn,
//         "precip_mm": precipMm,
//         "precip_in": precipIn,
//         "humidity": humidity,
//         "cloud": cloud,
//         "feelslike_c": feelslikeC,
//         "feelslike_f": feelslikeF,
//         "vis_km": visKm,
//         "vis_miles": visMiles,
//         "uv": uv,
//         "gust_mph": gustMph,
//         "gust_kph": gustKph,
//     };
// }

// class Condition {
//     String? text;
//     String? icon;
//     double? code;

//     Condition({
//         this.text,
//         this.icon,
//         this.code,
//     });

//     factory Condition.fromJson(Map<String, dynamic> json) => Condition(
//         text: json["text"],
//         icon: json["icon"],
//         code: json["code"]?.toDouble(),
//     );

//     Map<String, dynamic> toJson() => {
//         "text": text,
//         "icon": icon,
//         "code": code,
//     };
// }

// class Forecast {
//     List<Forecastday>? forecastday;

//     Forecast({
//         this.forecastday,
//     });

//     factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
//         forecastday: json["forecastday"] == null ? [] : List<Forecastday>.from(json["forecastday"]!.map((x) => Forecastday.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "forecastday": forecastday == null ? [] : List<dynamic>.from(forecastday!.map((x) => x.toJson())),
//     };
// }

// class Forecastday {
//     DateTime? date;
//     double? dateEpoch;
//     Day? day;
//     Astro? astro;
//     List<Hour>? hour;

//     Forecastday({
//         this.date,
//         this.dateEpoch,
//         this.day,
//         this.astro,
//         this.hour,
//     });

//     factory Forecastday.fromJson(Map<String, dynamic> json) => Forecastday(
//         date: json["date"] == null ? null : DateTime.parse(json["date"]),
//         dateEpoch: json["date_epoch"]?.toDouble(),
//         day: json["day"] == null ? null : Day.fromJson(json["day"]),
//         astro: json["astro"] == null ? null : Astro.fromJson(json["astro"]),
//         hour: json["hour"] == null ? [] : List<Hour>.from(json["hour"]!.map((x) => Hour.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
//         "date_epoch": dateEpoch,
//         "day": day?.toJson(),
//         "astro": astro?.toJson(),
//         "hour": hour == null ? [] : List<dynamic>.from(hour!.map((x) => x.toJson())),
//     };
// }

// class Astro {
//     String? sunrise;
//     String? sunset;
//     String? moonrise;
//     String? moonset;
//     String? moonPhase;
//     double? moonIllumination;
//     double? isMoonUp;
//     double? isSunUp;

//     Astro({
//         this.sunrise,
//         this.sunset,
//         this.moonrise,
//         this.moonset,
//         this.moonPhase,
//         this.moonIllumination,
//         this.isMoonUp,
//         this.isSunUp,
//     });

//     factory Astro.fromJson(Map<String, dynamic> json) => Astro(
//         sunrise: json["sunrise"],
//         sunset: json["sunset"],
//         moonrise: json["moonrise"],
//         moonset: json["moonset"],
//         moonPhase: json["moon_phase"],
//         moonIllumination: json["moon_illumination"]?.toDouble(),
//         isMoonUp: json["is_moon_up"]?.toDouble(),
//         isSunUp: json["is_sun_up"]?.toDouble(),
//     );

//     Map<String, dynamic> toJson() => {
//         "sunrise": sunrise,
//         "sunset": sunset,
//         "moonrise": moonrise,
//         "moonset": moonset,
//         "moon_phase": moonPhase,
//         "moon_illumination": moonIllumination,
//         "is_moon_up": isMoonUp,
//         "is_sun_up": isSunUp,
//     };
// }

// class Day {
//     double? maxtempC;
//     double? maxtempF;
//     double? mintempC;
//     double? mintempF;
//     double? avgtempC;
//     double? avgtempF;
//     double? maxwindMph;
//     double? maxwindKph;
//     double? totalprecipMm;
//     double? totalprecipIn;
//     double? totalsnowCm;
//     double? avgvisKm;
//     double? avgvisMiles;
//     double? avghumidity;
//     double? dailyWillItRain;
//     double? dailyChanceOfRain;
//     double? dailyWillItSnow;
//     double? dailyChanceOfSnow;
//     Condition? condition;
//     double? uv;

//     Day({
//         this.maxtempC,
//         this.maxtempF,
//         this.mintempC,
//         this.mintempF,
//         this.avgtempC,
//         this.avgtempF,
//         this.maxwindMph,
//         this.maxwindKph,
//         this.totalprecipMm,
//         this.totalprecipIn,
//         this.totalsnowCm,
//         this.avgvisKm,
//         this.avgvisMiles,
//         this.avghumidity,
//         this.dailyWillItRain,
//         this.dailyChanceOfRain,
//         this.dailyWillItSnow,
//         this.dailyChanceOfSnow,
//         this.condition,
//         this.uv,
//     });

//     factory Day.fromJson(Map<String, dynamic> json) => Day(
//         maxtempC: json["maxtemp_c"]?.toDouble(),
//         maxtempF: json["maxtemp_f"]?.toDouble(),
//         mintempC: json["mintemp_c"]?.toDouble(),
//         mintempF: json["mintemp_f"]?.toDouble(),
//         avgtempC: json["avgtemp_c"]?.toDouble(),
//         avgtempF: json["avgtemp_f"]?.toDouble(),
//         maxwindMph: json["maxwind_mph"]?.toDouble(),
//         maxwindKph: json["maxwind_kph"]?.toDouble(),
//         totalprecipMm: json["totalprecip_mm"]?.toDouble(),
//         totalprecipIn: json["totalprecip_in"]?.toDouble(),
//         totalsnowCm: json["totalsnow_cm"]?.toDouble(),
//         avgvisKm: json["avgvis_km"]?.toDouble(),
//         avgvisMiles: json["avgvis_miles"]?.toDouble(),
//         avghumidity: json["avghumidity"]?.toDouble(),
//         dailyWillItRain: json["daily_will_it_rain"]?.toDouble(),
//         dailyChanceOfRain: json["daily_chance_of_rain"]?.toDouble(),
//         dailyWillItSnow: json["daily_will_it_snow"]?.toDouble(),
//         dailyChanceOfSnow: json["daily_chance_of_snow"]?.toDouble(),
//         condition: json["condition"] == null ? null : Condition.fromJson(json["condition"]),
//         uv: json["uv"]?.toDouble(),
//     );

//     Map<String, dynamic> toJson() => {
//         "maxtemp_c": maxtempC,
//         "maxtemp_f": maxtempF,
//         "mintemp_c": mintempC,
//         "mintemp_f": mintempF,
//         "avgtemp_c": avgtempC,
//         "avgtemp_f": avgtempF,
//         "maxwind_mph": maxwindMph,
//         "maxwind_kph": maxwindKph,
//         "totalprecip_mm": totalprecipMm,
//         "totalprecip_in": totalprecipIn,
//         "totalsnow_cm": totalsnowCm,
//         "avgvis_km": avgvisKm,
//         "avgvis_miles": avgvisMiles,
//         "avghumidity": avghumidity,
//         "daily_will_it_rain": dailyWillItRain,
//         "daily_chance_of_rain": dailyChanceOfRain,
//         "daily_will_it_snow": dailyWillItSnow,
//         "daily_chance_of_snow": dailyChanceOfSnow,
//         "condition": condition?.toJson(),
//         "uv": uv,
//     };
// }

// class Hour {
//     double? timeEpoch;
//     String? time;
//     double? tempC;
//     double? tempF;
//     double? isDay;
//     Condition? condition;
//     double? windMph;
//     double? windKph;
//     double? windDegree;
//     String? windDir;
//     double? pressureMb;
//     double? pressureIn;
//     double? precipMm;
//     double? precipIn;
//     double? snowCm;
//     double? humidity;
//     double? cloud;
//     double? feelslikeC;
//     double? feelslikeF;
//     double? windchillC;
//     double? windchillF;
//     double? heatindexC;
//     double? heatindexF;
//     double? dewpointC;
//     double? dewpointF;
//     double? willItRain;
//     double? chanceOfRain;
//     double? willItSnow;
//     double? chanceOfSnow;
//     double? visKm;
//     double? visMiles;
//     double? gustMph;
//     double? gustKph;
//     double? uv;

//     Hour({
//         this.timeEpoch,
//         this.time,
//         this.tempC,
//         this.tempF,
//         this.isDay,
//         this.condition,
//         this.windMph,
//         this.windKph,
//         this.windDegree,
//         this.windDir,
//         this.pressureMb,
//         this.pressureIn,
//         this.precipMm,
//         this.precipIn,
//         this.snowCm,
//         this.humidity,
//         this.cloud,
//         this.feelslikeC,
//         this.feelslikeF,
//         this.windchillC,
//         this.windchillF,
//         this.heatindexC,
//         this.heatindexF,
//         this.dewpointC,
//         this.dewpointF,
//         this.willItRain,
//         this.chanceOfRain,
//         this.willItSnow,
//         this.chanceOfSnow,
//         this.visKm,
//         this.visMiles,
//         this.gustMph,
//         this.gustKph,
//         this.uv,
//     });

//     factory Hour.fromJson(Map<String, dynamic> json) => Hour(
//         timeEpoch: json["time_epoch"]?.toDouble(),
//         time: json["time"],
//         tempC: json["temp_c"]?.toDouble(),
//         tempF: json["temp_f"]?.toDouble(),
//         isDay: json["is_day"]?.toDouble(),
//         condition: json["condition"] == null ? null : Condition.fromJson(json["condition"]),
//         windMph: json["wind_mph"]?.toDouble(),
//         windKph: json["wind_kph"]?.toDouble(),
//         windDegree: json["wind_degree"]?.toDouble(),
//         windDir: json["wind_dir"],
//         pressureMb: json["pressure_mb"]?.toDouble(),
//         pressureIn: json["pressure_in"]?.toDouble(),
//         precipMm: json["precip_mm"]?.toDouble(),
//         precipIn: json["precip_in"]?.toDouble(),
//         snowCm: json["snow_cm"]?.toDouble(),
//         humidity: json["humidity"]?.toDouble(),
//         cloud: json["cloud"]?.toDouble(),
//         feelslikeC: json["feelslike_c"]?.toDouble(),
//         feelslikeF: json["feelslike_f"]?.toDouble(),
//         windchillC: json["windchill_c"]?.toDouble(),
//         windchillF: json["windchill_f"]?.toDouble(),
//         heatindexC: json["heatindex_c"]?.toDouble(),
//         heatindexF: json["heatindex_f"]?.toDouble(),
//         dewpointC: json["dewpoint_c"]?.toDouble(),
//         dewpointF: json["dewpoint_f"]?.toDouble(),
//         willItRain: json["will_it_rain"]?.toDouble(),
//         chanceOfRain: json["chance_of_rain"]?.toDouble(),
//         willItSnow: json["will_it_snow"]?.toDouble(),
//         chanceOfSnow: json["chance_of_snow"]?.toDouble(),
//         visKm: json["vis_km"]?.toDouble(),
//         visMiles: json["vis_miles"]?.toDouble(),
//         gustMph: json["gust_mph"]?.toDouble(),
//         gustKph: json["gust_kph"]?.toDouble(),
//         uv: json["uv"]?.toDouble(),
//     );

//     Map<String, dynamic> toJson() => {
//         "time_epoch": timeEpoch,
//         "time": time,
//         "temp_c": tempC,
//         "temp_f": tempF,
//         "is_day": isDay,
//         "condition": condition?.toJson(),
//         "wind_mph": windMph,
//         "wind_kph": windKph,
//         "wind_degree": windDegree,
//         "wind_dir": windDir,
//         "pressure_mb": pressureMb,
//         "pressure_in": pressureIn,
//         "precip_mm": precipMm,
//         "precip_in": precipIn,
//         "snow_cm": snowCm,
//         "humidity": humidity,
//         "cloud": cloud,
//         "feelslike_c": feelslikeC,
//         "feelslike_f": feelslikeF,
//         "windchill_c": windchillC,
//         "windchill_f": windchillF,
//         "heatindex_c": heatindexC,
//         "heatindex_f": heatindexF,
//         "dewpoint_c": dewpointC,
//         "dewpoint_f": dewpointF,
//         "will_it_rain": willItRain,
//         "chance_of_rain": chanceOfRain,
//         "will_it_snow": willItSnow,
//         "chance_of_snow": chanceOfSnow,
//         "vis_km": visKm,
//         "vis_miles": visMiles,
//         "gust_mph": gustMph,
//         "gust_kph": gustKph,
//         "uv": uv,
//     };
// }

// class Location {
//     String? name;
//     String? region;
//     String? country;
//     double? lat;
//     double? lon;
//     String? tzId;
//     double? localtimeEpoch;
//     String? localtime;

//     Location({
//         this.name,
//         this.region,
//         this.country,
//         this.lat,
//         this.lon,
//         this.tzId,
//         this.localtimeEpoch,
//         this.localtime,
//     });

//     factory Location.fromJson(Map<String, dynamic> json) => Location(
//         name: json["name"],
//         region: json["region"],
//         country: json["country"],
//         lat: json["lat"]?.toDouble(),
//         lon: json["lon"]?.toDouble(),
//         tzId: json["tz_id"],
//         localtimeEpoch: json["localtime_epoch"]?.toDouble(),
//         localtime: json["localtime"],
//     );

//     Map<String, dynamic> toJson() => {
//         "name": name,
//         "region": region,
//         "country": country,
//         "lat": lat,
//         "lon": lon,
//         "tz_id": tzId,
//         "localtime_epoch": localtimeEpoch,
//         "localtime": localtime,
//     };
// }
