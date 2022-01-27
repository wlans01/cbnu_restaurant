import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:cbnu_restaurant/store/store.dart';
import 'package:provider/provider.dart';
import 'package:cbnu_restaurant/api/get_marker_data.dart';

class GoogleMapScreen extends StatefulWidget {
  GoogleMapScreen({Key? key, this.onchangenav}) : super(key: key);
  final onchangenav;

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  final Set<Marker> _markers = {};
  final Set<Marker> _markers2 = {};
  late List<Set<Marker>> markerss = [_markers, _markers2];
  late GoogleMapController _mapController;
  late BitmapDescriptor _mapMarker;
  var markerData;
  var currentPosition;

  CameraPosition _initialCameraPosition = CameraPosition(
      target: LatLng(36.628518156306306, 127.45666120598938), zoom: 15);

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < context.read<Store>().uirlList.length; i++) {
      getData(context.read<Store>().uirlList[i], i);
    }
    setCustomMarker();
  }

  getData(url, i) async {
    var result = await GetMarker().getHttp(url);
    if (result != null) {
      setState(() {
        result.forEach((e) {
          markerss[i].add(Marker(
              onTap: () {
                widget.onchangenav(1);
              },
              markerId: MarkerId(e.id),
              position: LatLng(e.latitude, e.longitude),
              icon: _mapMarker,
              infoWindow: InfoWindow(
                  title: e.title, snippet: e.snippet, onTap: () {})));
        });
      });
    } else {
      Get.snackbar('가맹점 데이터 가져오기 실패', "데이터가 비어있음?!");
    }
  }

  void setCustomMarker() async {
    _mapMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/ga.png');
  }

  Future<void> _UpdatePosition() async {
    Position pos = await _determinePosition();
    currentPosition = LatLng(pos.latitude, pos.longitude);
    var cameraPosition = CameraPosition(target: currentPosition, zoom: 15);
    _mapController.moveCamera(CameraUpdate.newCameraPosition(cameraPosition));
    setState(() {
      _initialCameraPosition = cameraPosition;
    });
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(alignment: Alignment.center, children: [
        GoogleMap(
            onMapCreated: _onMapCreated,
            markers: markerss[context.read<Store>().navIndex],
            mapToolbarEnabled: false,
            zoomControlsEnabled: false,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            initialCameraPosition: _initialCameraPosition),
        Positioned(
            top: 50,
            child: Container(
              width: MediaQuery.of(context).size.width - 24,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.manage_search,
                              size: 35,
                            ),
                            color: Colors.grey),
                      ),
                      Text(
                        '오늘도 맛있는 한끼!',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () {
                        context
                            .read<Store>()
                            .drawerkey
                            .currentState!
                            .openDrawer();
                      },
                      icon: Icon(
                        Icons.settings,
                        size: 30,
                      ),
                      color: Colors.grey),
                ],
              ),
            )),
        Positioned(
            top: 100,
            left: 12,
            child: ElevatedButton(
              onPressed: () {
                widget.onchangenav(0);
              },
              child: Text(
                "오늘은 뭐먹지?",
                style: TextStyle(color: Colors.black87),
              ),
            )),
        Positioned(
            top: 100,
            right: 12,
            child: ElevatedButton(
              onPressed: () {
                widget.onchangenav(1);
              },
              child: Text(
                "맛있게 먹었으면 광고한번?",
                style: TextStyle(color: Colors.black87),
              ),
            )),
      ]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: _UpdatePosition,
        child: Icon(Icons.location_on_outlined, color: Colors.black87),
      ),
    );
  }
}
