/// consolidated_weather : [{"id":5690811208433664,"weather_state_name":"Light Rain","weather_state_abbr":"lr","wind_direction_compass":"SE","created":"2022-01-25T13:46:31.668107Z","applicable_date":"2022-01-25","min_temp":18.725,"max_temp":22.765,"the_temp":22.380000000000003,"wind_speed":5.722788487709113,"wind_direction":141.1138582828237,"air_pressure":1014.5,"humidity":83,"visibility":10.132700031814206,"predictability":75},{"id":4681859502964736,"weather_state_name":"Light Rain","weather_state_abbr":"lr","wind_direction_compass":"SE","created":"2022-01-25T13:46:34.545337Z","applicable_date":"2022-01-26","min_temp":18.785,"max_temp":25.255000000000003,"the_temp":23.715,"wind_speed":5.828456166544712,"wind_direction":137.75999173989968,"air_pressure":1013.5,"humidity":83,"visibility":10.913452934860416,"predictability":75},{"id":5522684277424128,"weather_state_name":"Light Rain","weather_state_abbr":"lr","wind_direction_compass":"SE","created":"2022-01-25T13:46:37.412990Z","applicable_date":"2022-01-27","min_temp":19.8,"max_temp":25.765,"the_temp":25.81,"wind_speed":7.471706966791273,"wind_direction":139.76571111608936,"air_pressure":1012.5,"humidity":79,"visibility":10.455191680585381,"predictability":75},{"id":6486769949212672,"weather_state_name":"Light Rain","weather_state_abbr":"lr","wind_direction_compass":"SE","created":"2022-01-25T13:46:40.169782Z","applicable_date":"2022-01-28","min_temp":19.82,"max_temp":26.22,"the_temp":26.305,"wind_speed":8.07891136152337,"wind_direction":141.79669588222134,"air_pressure":1011.5,"humidity":76,"visibility":10.835781535830748,"predictability":75},{"id":5978798966177792,"weather_state_name":"Heavy Rain","weather_state_abbr":"hr","wind_direction_compass":"NE","created":"2022-01-25T13:46:43.142874Z","applicable_date":"2022-01-29","min_temp":12.504999999999999,"max_temp":20.37,"the_temp":19.78,"wind_speed":8.704915537678623,"wind_direction":55.21956628546503,"air_pressure":1011.0,"humidity":84,"visibility":8.422065139584824,"predictability":77},{"id":5021555814825984,"weather_state_name":"Heavy Rain","weather_state_abbr":"hr","wind_direction_compass":"NNE","created":"2022-01-25T13:46:46.195234Z","applicable_date":"2022-01-30","min_temp":12.32,"max_temp":14.07,"the_temp":13.2,"wind_speed":4.373712121212121,"wind_direction":27.0,"air_pressure":1013.0,"humidity":78,"visibility":9.999726596675416,"predictability":77}]
/// time : "2022-01-25T22:37:57.153947+07:00"
/// sun_rise : "2022-01-25T06:35:23.055976+07:00"
/// sun_set : "2022-01-25T17:42:33.113581+07:00"
/// timezone_name : "LMT"
/// parent : {"title":"Vietnam","location_type":"Country","woeid":23424984,"latt_long":"15.974210,107.868042"}
/// sources : [{"title":"BBC","slug":"bbc","url":"http://www.bbc.co.uk/weather/","crawl_rate":360},{"title":"Forecast.io","slug":"forecast-io","url":"http://forecast.io/","crawl_rate":480},{"title":"Met Office","slug":"met-office","url":"http://www.metoffice.gov.uk/","crawl_rate":180},{"title":"OpenWeatherMap","slug":"openweathermap","url":"http://openweathermap.org/","crawl_rate":360},{"title":"World Weather Online","slug":"world-weather-online","url":"http://www.worldweatheronline.com/","crawl_rate":360}]
/// title : "Hà Nội"
/// location_type : "City"
/// woeid : 1236594
/// latt_long : "21.031950,105.819908"
/// timezone : "Asia/Ho_Chi_Minh"

class WeatherResponse {
  WeatherResponse({
      List<ConsolidatedWeather>? consolidatedWeather,
      String? time, 
      String? sunRise, 
      String? sunSet, 
      String? timezoneName, 
      Parent? parent, 
      List<Sources>? sources, 
      String? title, 
      String? locationType, 
      int? woeid, 
      String? lattLong, 
      String? timezone,}){
    _consolidatedWeather = consolidatedWeather;
    _time = time;
    _sunRise = sunRise;
    _sunSet = sunSet;
    _timezoneName = timezoneName;
    _parent = parent;
    _sources = sources;
    _title = title;
    _locationType = locationType;
    _woeid = woeid;
    _lattLong = lattLong;
    _timezone = timezone;
}

  WeatherResponse.fromJson(dynamic json) {
    if (json['consolidated_weather'] != null) {
      _consolidatedWeather = [];
      json['consolidated_weather'].forEach((v) {
        _consolidatedWeather?.add(ConsolidatedWeather.fromJson(v));
      });
    }
    _time = json['time'];
    _sunRise = json['sun_rise'];
    _sunSet = json['sun_set'];
    _timezoneName = json['timezone_name'];
    _parent = json['parent'] != null ? Parent.fromJson(json['parent']) : null;
    if (json['sources'] != null) {
      _sources = [];
      json['sources'].forEach((v) {
        _sources?.add(Sources.fromJson(v));
      });
    }
    _title = json['title'];
    _locationType = json['location_type'];
    _woeid = json['woeid'];
    _lattLong = json['latt_long'];
    _timezone = json['timezone'];
  }
  List<ConsolidatedWeather>? _consolidatedWeather;
  String? _time;
  String? _sunRise;
  String? _sunSet;
  String? _timezoneName;
  Parent? _parent;
  List<Sources>? _sources;
  String? _title;
  String? _locationType;
  int? _woeid;
  String? _lattLong;
  String? _timezone;

  List<ConsolidatedWeather>? get consolidatedWeather => _consolidatedWeather;
  String? get time => _time;
  String? get sunRise => _sunRise;
  String? get sunSet => _sunSet;
  String? get timezoneName => _timezoneName;
  Parent? get parent => _parent;
  List<Sources>? get sources => _sources;
  String? get title => _title;
  String? get locationType => _locationType;
  int? get woeid => _woeid;
  String? get lattLong => _lattLong;
  String? get timezone => _timezone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_consolidatedWeather != null) {
      map['consolidated_weather'] = _consolidatedWeather?.map((v) => v.toJson()).toList();
    }
    map['time'] = _time;
    map['sun_rise'] = _sunRise;
    map['sun_set'] = _sunSet;
    map['timezone_name'] = _timezoneName;
    if (_parent != null) {
      map['parent'] = _parent?.toJson();
    }
    if (_sources != null) {
      map['sources'] = _sources?.map((v) => v.toJson()).toList();
    }
    map['title'] = _title;
    map['location_type'] = _locationType;
    map['woeid'] = _woeid;
    map['latt_long'] = _lattLong;
    map['timezone'] = _timezone;
    return map;
  }

}

/// title : "BBC"
/// slug : "bbc"
/// url : "http://www.bbc.co.uk/weather/"
/// crawl_rate : 360

class Sources {
  Sources({
      String? title, 
      String? slug, 
      String? url, 
      int? crawlRate,}){
    _title = title;
    _slug = slug;
    _url = url;
    _crawlRate = crawlRate;
}

  Sources.fromJson(dynamic json) {
    _title = json['title'];
    _slug = json['slug'];
    _url = json['url'];
    _crawlRate = json['crawl_rate'];
  }
  String? _title;
  String? _slug;
  String? _url;
  int? _crawlRate;

  String? get title => _title;
  String? get slug => _slug;
  String? get url => _url;
  int? get crawlRate => _crawlRate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['slug'] = _slug;
    map['url'] = _url;
    map['crawl_rate'] = _crawlRate;
    return map;
  }

}

/// title : "Vietnam"
/// location_type : "Country"
/// woeid : 23424984
/// latt_long : "15.974210,107.868042"

class Parent {
  Parent({
      String? title, 
      String? locationType, 
      int? woeid, 
      String? lattLong,}){
    _title = title;
    _locationType = locationType;
    _woeid = woeid;
    _lattLong = lattLong;
}

  Parent.fromJson(dynamic json) {
    _title = json['title'];
    _locationType = json['location_type'];
    _woeid = json['woeid'];
    _lattLong = json['latt_long'];
  }
  String? _title;
  String? _locationType;
  int? _woeid;
  String? _lattLong;

  String? get title => _title;
  String? get locationType => _locationType;
  int? get woeid => _woeid;
  String? get lattLong => _lattLong;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['location_type'] = _locationType;
    map['woeid'] = _woeid;
    map['latt_long'] = _lattLong;
    return map;
  }

}

/// id : 5690811208433664
/// weather_state_name : "Light Rain"
/// weather_state_abbr : "lr"
/// wind_direction_compass : "SE"
/// created : "2022-01-25T13:46:31.668107Z"
/// applicable_date : "2022-01-25"
/// min_temp : 18.725
/// max_temp : 22.765
/// the_temp : 22.380000000000003
/// wind_speed : 5.722788487709113
/// wind_direction : 141.1138582828237
/// air_pressure : 1014.5
/// humidity : 83
/// visibility : 10.132700031814206
/// predictability : 75

class ConsolidatedWeather {
  ConsolidatedWeather({
      int? id, 
      String? weatherStateName, 
      String? weatherStateAbbr, 
      String? windDirectionCompass, 
      String? created, 
      String? applicableDate, 
      double? minTemp, 
      double? maxTemp, 
      double? theTemp, 
      double? windSpeed, 
      double? windDirection, 
      double? airPressure, 
      int? humidity, 
      double? visibility, 
      int? predictability,}){
    _id = id;
    _weatherStateName = weatherStateName;
    _weatherStateAbbr = weatherStateAbbr;
    _windDirectionCompass = windDirectionCompass;
    _created = created;
    _applicableDate = applicableDate;
    _minTemp = minTemp;
    _maxTemp = maxTemp;
    _theTemp = theTemp;
    _windSpeed = windSpeed;
    _windDirection = windDirection;
    _airPressure = airPressure;
    _humidity = humidity;
    _visibility = visibility;
    _predictability = predictability;
}

  ConsolidatedWeather.fromJson(dynamic json) {
    _id = json['id'];
    _weatherStateName = json['weather_state_name'];
    _weatherStateAbbr = json['weather_state_abbr'];
    _windDirectionCompass = json['wind_direction_compass'];
    _created = json['created'];
    _applicableDate = json['applicable_date'];
    _minTemp = json['min_temp'];
    _maxTemp = json['max_temp'];
    _theTemp = json['the_temp'];
    _windSpeed = json['wind_speed'];
    _windDirection = json['wind_direction'];
    _airPressure = json['air_pressure'];
    _humidity = json['humidity'];
    _visibility = json['visibility'];
    _predictability = json['predictability'];
  }
  int? _id;
  String? _weatherStateName;
  String? _weatherStateAbbr;
  String? _windDirectionCompass;
  String? _created;
  String? _applicableDate;
  double? _minTemp;
  double? _maxTemp;
  double? _theTemp;
  double? _windSpeed;
  double? _windDirection;
  double? _airPressure;
  int? _humidity;
  double? _visibility;
  int? _predictability;

  int? get id => _id;
  String? get weatherStateName => _weatherStateName;
  String? get weatherStateAbbr => _weatherStateAbbr;
  String? get windDirectionCompass => _windDirectionCompass;
  String? get created => _created;
  String? get applicableDate => _applicableDate;
  double? get minTemp => _minTemp;
  double? get maxTemp => _maxTemp;
  double? get theTemp => _theTemp;
  double? get windSpeed => _windSpeed;
  double? get windDirection => _windDirection;
  double? get airPressure => _airPressure;
  int? get humidity => _humidity;
  double? get visibility => _visibility;
  int? get predictability => _predictability;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['weather_state_name'] = _weatherStateName;
    map['weather_state_abbr'] = _weatherStateAbbr;
    map['wind_direction_compass'] = _windDirectionCompass;
    map['created'] = _created;
    map['applicable_date'] = _applicableDate;
    map['min_temp'] = _minTemp;
    map['max_temp'] = _maxTemp;
    map['the_temp'] = _theTemp;
    map['wind_speed'] = _windSpeed;
    map['wind_direction'] = _windDirection;
    map['air_pressure'] = _airPressure;
    map['humidity'] = _humidity;
    map['visibility'] = _visibility;
    map['predictability'] = _predictability;
    return map;
  }

}