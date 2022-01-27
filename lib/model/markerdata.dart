class Markerdata {
  Markerdata({
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.title,
    required this.snippet,
    required this.type,
  });

  final String id;
  final double latitude;
  final double longitude;
  final String title;
  final String snippet;
  final String type;

  factory Markerdata.fromJson(Map<String, dynamic> json) => Markerdata(
    id: json["id"],
    latitude: json["latitude"].toDouble(),
    longitude: json["longitude"].toDouble(),
    title: json["title"],
    snippet: json["snippet"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "latitude": latitude,
    "longitude": longitude,
    "title": title,
    "snippet": snippet,
    "type": type,
  };
}