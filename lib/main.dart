import 'package:cbnu_restaurant/css.dart';
import 'package:cbnu_restaurant/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cbnu_restaurant/screens/googlemapscreen.dart';
import 'package:cbnu_restaurant/store/store.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

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
  SnakeBarBehaviour snakeBarStyle = SnakeBarBehaviour.floating;
  SnakeShape snakeShape = SnakeShape.indicator;
  EdgeInsets padding = const EdgeInsets.only(left: 12, right: 12, bottom: 24);

  bool _isInitialValue = false;

  void onchangenav(int i) {
    switch (i) {
      case 0:
        setState(() {
          snakeBarStyle = SnakeBarBehaviour.floating;
          snakeShape = SnakeShape.indicator;
          padding = const EdgeInsets.only(left: 12, right: 12, bottom: 24);
          _isInitialValue = false;
        });
        break;
      case 1:
        setState(() {
          snakeBarStyle = SnakeBarBehaviour.pinned;
          snakeShape = SnakeShape.indicator;
          padding = EdgeInsets.zero;
          _isInitialValue = true;
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<Store>().drawerkey,
      extendBodyBehindAppBar: true,
      extendBody: true,
      resizeToAvoidBottomInset: true,
      body: Stack(children: [
        GoogleMapScreen(onchangenav: onchangenav),
        Positioned(
            bottom: 60,
            child: Visibility(
              visible: _isInitialValue,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '우리동넹 주먹가게',
                          style: TextStyle(fontSize: 25),
                        ),
                        Text('메뉴: 주먹구이, 장어구이'),
                        Text('번호: 010-xxxx-xxxx'),
                        Text('영업시간: 매일 오후 3시 ~ 5시'),
                      ],
                    ),
                    Column(
                      children: [
                        Text('좋아요'),
                        Row(
                          children: [
                            Icon(Icons.volunteer_activism),
                            Text('4.5'),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ))
      ]),
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
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: '전체'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '한식'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '일식'),
          BottomNavigationBarItem(icon: Icon(Icons.podcasts), label: '중식'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: '양식'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: '기타')
        ],
      ),
      drawer: Sidebar(),
    );
  }
}
