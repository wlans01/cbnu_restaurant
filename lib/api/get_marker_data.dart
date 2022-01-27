import 'package:dio/dio.dart';


class GetMarker {
  getHttp(url) async {
    try {
      var response =
          await Dio().get(url);
      List<Markerdata> markerdata = (response.data)
          .map<Markerdata>((json) => Markerdata.fromJson(json))
          .toList();
      return markerdata;
    } catch (e) {
      print(e);
    }
  }
}

class Markerdata {
  Markerdata({
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.title,
    required this.snippet,
  });

  final String id;
  final double latitude;
  final double longitude;
  final String title;
  final String snippet;

  factory Markerdata.fromJson(Map<String, dynamic> json) => Markerdata(
        id: json["id"],
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        title: json["title"],
        snippet: json["snippet"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "latitude": latitude,
        "longitude": longitude,
        "title": title,
        "snippet": snippet,
      };
}
