/// title : "San Francisco"
/// location_type : "City"
/// woeid : 2487956
/// latt_long : "37.777119, -122.41964"

class Locations {
  Locations({
      String? title, 
      String? locationType, 
      int? woeid, 
      String? lattLong,}){
    _title = title;
    _locationType = locationType;
    _woeid = woeid;
    _lattLong = lattLong;
}

  Locations.fromJson(dynamic json) {
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