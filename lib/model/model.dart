// To parse this JSON data, do
//
//     final weather = weatherFromJson(jsonString);

import 'dart:convert';

Weather weatherFromJson(String str) => Weather.fromJson(json.decode(str));

String weatherToJson(Weather data) => json.encode(data.toJson());

class Weather {
  List<ListElement> list;
  City city;

  Weather({
    required this.list,
    required this.city,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        list: List<ListElement>.from(
            json["list"].map((x) => ListElement.fromJson(x))),
        city: City.fromJson(json["city"]),
      );

  Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
        "city": city.toJson(),
      };
}

class City {
  int id;
  String name;

  String country;

  int sunrise;
  int sunset;

  City({
    required this.id,
    required this.name,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        name: json["name"],
        country: json["country"],
    
        sunrise: json["sunrise"],
        sunset: json["sunset"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country": country,
 
        "sunrise": sunrise,
        "sunset": sunset,
      };
}

class ListElement {
  int dt;
  MainClass main;
  List<WeatherElement> weather;
  Wind wind;
  int visibility;
  double? pop;
  Sys sys;
  DateTime dtTxt;

  ListElement({
    required this.dt,
    required this.main,
    required this.weather,
    required this.wind,
    required this.visibility,
    required this.pop,
    required this.sys,
    required this.dtTxt,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        dt: json["dt"],
        main: MainClass.fromJson(json["main"]),
        weather: List<WeatherElement>.from(
            json["weather"].map((x) => WeatherElement.fromJson(x))),
        wind: Wind.fromJson(json["wind"]),
        visibility: json["visibility"],
        pop: json["pop"]?.toDouble(),
        sys: Sys.fromJson(json["sys"]),
        dtTxt: DateTime.parse(json["dt_txt"]),
      );

  Map<String, dynamic> toJson() => {
        "dt": dt,
        "main": main.toJson(),
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),

        "wind": wind.toJson(),
        "visibility": visibility,
        "pop": pop,
        // "rain": rain.toJson(),
        "sys": sys.toJson(),
        "dt_txt": dtTxt.toIso8601String(),
      };
}

class MainClass {
  double temp;

  double tempMin;
  double tempMax;

  int humidity;
  double tempKf;

  MainClass({
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.humidity,
    required this.tempKf,
  });

  factory MainClass.fromJson(Map<String, dynamic> json) => MainClass(
        temp: json["temp"]?.toDouble(),
        tempMin: json["temp_min"]?.toDouble(),
        tempMax: json["temp_max"]?.toDouble(),
        humidity: json["humidity"],
        tempKf: json["temp_kf"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "temp": temp,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "humidity": humidity,
        "temp_kf": tempKf,
      };
}

class Sys {
  Pod pod;

  Sys({
    required this.pod,
  });

  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
        pod: podValues.map[json["pod"]]!,
      );

  Map<String, dynamic> toJson() => {
        "pod": podValues.reverse[pod],
      };
}

enum Pod { D, N }

final podValues = EnumValues({"d": Pod.D, "n": Pod.N});

class WeatherElement {
  int id;
  MainEnum main;
  Description description;
  String icon;

  WeatherElement({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherElement.fromJson(Map<String, dynamic> json) => WeatherElement(
        id: json["id"],
        main: mainEnumValues.map[json["main"]]!,
        description: descriptionValues.map[json["description"]]!,
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "main": mainEnumValues.reverse[main],
        "description": descriptionValues.reverse[description],
        "icon": icon,
      };
}

enum Description {
  BROKEN_CLOUDS,
  CLEAR_SKY,
  FEW_CLOUDS,
  LIGHT_RAIN,
  OVERCAST_CLOUDS,
  SCATTERED_CLOUDS
}

final descriptionValues = EnumValues({
  "broken clouds": Description.BROKEN_CLOUDS,
  "clear sky": Description.CLEAR_SKY,
  "few clouds": Description.FEW_CLOUDS,
  "light rain": Description.LIGHT_RAIN,
  "overcast clouds": Description.OVERCAST_CLOUDS,
  "scattered clouds": Description.SCATTERED_CLOUDS
});

enum MainEnum { CLEAR, CLOUDS, RAIN }

final mainEnumValues = EnumValues({
  "Clear": MainEnum.CLEAR,
  "Clouds": MainEnum.CLOUDS,
  "Rain": MainEnum.RAIN
});

class Wind {
  double speed;
  int deg;
  double gust;

  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json["speed"]?.toDouble(),
        deg: json["deg"],
        gust: json["gust"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "speed": speed,
        "deg": deg,
        "gust": gust,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
