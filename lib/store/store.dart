import 'package:flutter/material.dart';


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
    'https://wlans01.github.io/testdata/data2.json',
    'https://wlans01.github.io/testdata/data.json',
    'https://wlans01.github.io/testdata/data.json',
    'https://wlans01.github.io/testdata/data.json',
    'https://wlans01.github.io/testdata/data.json',
    'https://wlans01.github.io/testdata/data.json',
  ];

  //음식종류별 그거
  var allR = [];

  addAllR(a){
    allR.add(a);
  }
}
