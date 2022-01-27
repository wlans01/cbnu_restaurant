import 'package:dio/dio.dart';
import 'package:cbnu_restaurant/model/markerdata.dart';

class GetMarker {
  getHttp() async {
    try {
      var response =
          await Dio().get('https://wlans01.github.io/testdata/data.json');
      List<Markerdata> markerdata = (response.data)
          .map<Markerdata>((json) => Markerdata.fromJson(json))
          .toList();
      return markerdata;
    } catch (e) {
      print(e);
      print('???????????????????????????????????????????????????');
      throw Exception();
    }
  }
}


