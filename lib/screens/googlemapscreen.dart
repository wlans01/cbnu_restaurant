import 'package:cbnu_restaurant/screens/testtt.dart';
import 'package:cbnu_restaurant/widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:cbnu_restaurant/store/store.dart';
import 'package:provider/provider.dart';
import 'package:cbnu_restaurant/api/get_marker_data.dart';

class GoogleMapScreen extends StatefulWidget {
  GoogleMapScreen({Key? key, this.onchangenav, this.fabHeight})
      : super(key: key);
  final onchangenav;
  final fabHeight;

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  final Set<Marker> _markersA = {};
  final Set<Marker> _markersK = {};
  final Set<Marker> _markersJ = {};
  final Set<Marker> _markersC = {};
  final Set<Marker> _markersW = {};
  final Set<Marker> _markersM = {};
  late List<Set<Marker>> markerss = [
    _markersA,
    _markersK,
    _markersJ,
    _markersC,
    _markersW,
    _markersM
  ];
  final List<String> _identification = ['a', 'k', 'j', 'c', 'w', 'm'];
  late GoogleMapController _mapController;
  late BitmapDescriptor _mapMarker;
  var markerData;
  var currentPosition;

  CameraPosition _initialCameraPosition = CameraPosition(
      target: LatLng(36.628518156306306, 127.45666120598938), zoom: 15);

  @override
  void initState() {
    super.initState();
    getData();
    setCustomMarker();
  }

  getData() async {
    var result = await GetMarker().getHttp();
    if (result != null) {
      print(result);
      context.read<Store>().addAllR(result);
      for (var i = 0; i < _identification.length; i++) {
        if (i == 0) {
          setState(() {
            result.forEach((e) {
              _markersA.add(Marker(
                  onTap: () {},
                  markerId: MarkerId(e.id),
                  position: LatLng(e.latitude, e.longitude),
                  icon: _mapMarker,
                  infoWindow: InfoWindow(
                      title: e.title, snippet: e.type, onTap: () {})));
            });
          });
        }
        var res = result.where((e) => e.type == _identification[i]);
        setState(() {
          res.forEach((e) {
            markerss[i].add(Marker(
                onTap: () {},
                markerId: MarkerId(e.id),
                position: LatLng(e.latitude, e.longitude),
                icon: _mapMarker,
                infoWindow:
                    InfoWindow(title: e.title, snippet: e.type, onTap: () {})));
          });
        });
      }
    } else {
      Get.snackbar('가맹점 데이터 가져오기 실패', "데이터가 비어있음?!");
    }
  }

  void setCustomMarker() async {
    _mapMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/ga.png');
  }

  Future<void> _updatePosition() async {
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
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 4,
                    )
                  ]),
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
                            onPressed: () {
                              showSearch(
                                  context: context,
                                  delegate: CustomSearchDelegate());
                            },
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
            top: 105,
            left: 12,
            child: ElevatedButton(
              onPressed: () {
                Get.to(Testtt());
              },
              child: Text(
                "오늘은 뭐먹지?",
                style: TextStyle(color: Colors.redAccent.shade100),
              ),
            )),
        Positioned(
          bottom: widget.fabHeight,
          right: 12,
          child: FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: _updatePosition,
            child: Icon(Icons.location_on_outlined, color: Colors.black87),
          ),
        )
      ]),
    );
  }
}
