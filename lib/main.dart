import 'package:cbnu_restaurant/css.dart';
import 'package:cbnu_restaurant/sidebar.dart';
import 'package:cbnu_restaurant/widgets/panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cbnu_restaurant/screens/googlemapscreen.dart';
import 'package:cbnu_restaurant/store/store.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return ChangeNotifierProvider(
      create: (c) => Store(),
      child: GetMaterialApp(
        title: 'Good Attitude',
        theme: css,
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SnakeBarBehaviour snakeBarStyle = SnakeBarBehaviour.pinned;
  SnakeShape snakeShape = SnakeShape.indicator;
  EdgeInsets padding = EdgeInsets.zero;

  final double _initFabHeight = 110.0;
  double fabHeight = 0;
  double _panelHeightOpen = 0;
  final double _panelHeightClosed = 95.0;

  void onchangenav(int i) {
    switch (i) {
      case 0:
        setState(() {
          snakeBarStyle = SnakeBarBehaviour.floating;
          snakeShape = SnakeShape.indicator;
          padding = const EdgeInsets.only(left: 12, right: 12, bottom: 24);
        });
        break;
      case 1:
        setState(() {
          snakeBarStyle = SnakeBarBehaviour.pinned;
          snakeShape = SnakeShape.indicator;
          padding = EdgeInsets.zero;
        });
    }
  }

  @override
  void initState() {
    super.initState();

    fabHeight = _initFabHeight;
  }

  @override
  Widget build(BuildContext context) {
    _panelHeightOpen = MediaQuery.of(context).size.height * .70;
    return Scaffold(
      key: context.read<Store>().drawerkey,
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: SlidingUpPanel(
          maxHeight: _panelHeightOpen,
          minHeight: _panelHeightClosed,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18.0), topRight: Radius.circular(18.0)),
          panelBuilder: (sc) => panel(sc,context),
          parallaxEnabled: true,
          parallaxOffset: .5,
          onPanelSlide: (double pos) => setState(() {
                fabHeight = pos / 2 * (_panelHeightOpen - _panelHeightClosed) +
                    _initFabHeight;
              }),
          body:
              GoogleMapScreen(onchangenav: onchangenav, fabHeight: fabHeight)),
      drawer: Sidebar(),
      bottomNavigationBar: SnakeNavigationBar.color(
        behaviour: snakeBarStyle,
        snakeShape: snakeShape,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        padding: padding,
        height: 60,

        ///configuration for SnakeNavigationBar.color
        snakeViewColor: Colors.redAccent,
        selectedItemColor: Colors.redAccent.shade100,

        unselectedItemColor: Colors.blueGrey,

        showUnselectedLabels: true,
        showSelectedLabels: true,

        currentIndex: context.read<Store>().navIndex,
        onTap: (index) =>
            setState(() => context.read<Store>().currentIndex(index)),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.restaurant), label: '전체'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '한식'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '일식'),
          BottomNavigationBarItem(icon: Icon(Icons.podcasts), label: '중식'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: '양식'),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: '기타')
        ],
      ),
    );
  }





}

