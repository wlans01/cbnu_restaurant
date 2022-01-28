import 'package:flutter/material.dart';
import 'package:cbnu_restaurant/model/markerdata.dart';

class Store extends ChangeNotifier {
  //유저 정보
  var name = 'Good Attitude';

  //사이드바
  final GlobalKey<ScaffoldState> drawerkey = GlobalKey();

  //로그인 확인
  bool isLogin = false;

  //로그인상태 변경
  currentLogin(bool a) {
    isLogin = a;
    notifyListeners();
  }

  //네비
  int navIndex = 0;

  //네비 인덱스 변화
  currentIndex(i) {
    navIndex = i;
    notifyListeners();
  }

  //데이터 주소모음
  List<String> uirlList = [
    'https://wlans01.github.io/testdata/k.json',
    'https://wlans01.github.io/testdata/j.json',
    'https://wlans01.github.io/testdata/c.json',
    'https://wlans01.github.io/testdata/w.json',
    'https://wlans01.github.io/testdata/m.json',
  ];

  //음식종류별 그거

  List<Markerdata> kR = [];
  List<Markerdata> jR = [];
  List<Markerdata> cR = [];
  List<Markerdata> wR = [];
  List<Markerdata> mR = [];
  late List<Markerdata> allR = [...kR, ...jR, ...cR, ...wR, ...mR];

  addAllR(a, i) {
    switch (i) {
      case 0:
        kR = a;
        break;
      case 1:
        jR = a;
        break;
      case 2:
        cR = a;
        break;
      case 3:
        wR = a;
        break;
      case 4:
        mR = a;
        break;
    }
  }
}
