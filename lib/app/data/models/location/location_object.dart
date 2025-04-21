class LocationObject {
  final String name;
  final String displayName;
  final String lat;
  final String lon;

  LocationObject({
    required this.name,
    required this.displayName,
    required this.lat,
    required this.lon,
  });

  factory LocationObject.fromJson(Map<String, dynamic> json) {
    return LocationObject(
      name: json['name'],
      displayName: json['display_name'],
      lat: json['lat'],
      lon: json['lon'],
    );
  }
}
