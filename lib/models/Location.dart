class Location {
  final num latitude;
  final num longitude;

  const Location({
    required this.latitude,
    required this.longitude,
  });

  static Location deserialize(Map<String, dynamic> json) {
    return Location(
      latitude: json["latitude"],
      longitude: json["longitude"],
    );
  }
}