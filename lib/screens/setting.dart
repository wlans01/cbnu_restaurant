import 'package:flutter/material.dart';
import 'package:cbnu_restaurant/store/store.dart';
import 'package:provider/provider.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('환경설정'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Text(
                  "계정정보",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(primary: Colors.black87),
                  child: Text(
                    "로그아웃",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
          Container(
            width: 360,
            height: 70,
            color: Colors.indigo.shade50,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('GA가맹점', style: TextStyle(fontSize: 15)),
                  Text('010-xxxx-xxxx', style: TextStyle(fontSize: 15))
                ],
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Text("버전정보",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ),
            ],
          ),
          Container(
            width: 360,
            height: 70,
            color: Colors.indigo.shade50,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('버전1.0', style: TextStyle(fontSize: 15)),
                  Text('최신버전', style: TextStyle(fontSize: 15))
                ],
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Text('서비스 정보',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ),
            ],
          ),
          OutlinedButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '서비스 약관',
                    style: TextStyle(fontSize: 15, color: Colors.black87),
                  ),
                  Icon(Icons.chevron_right, size: 30, color: Colors.black87)
                ],
              )),
          OutlinedButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('개인정보 처리 방침',
                      style: TextStyle(fontSize: 15, color: Colors.black87)),
                  Icon(Icons.chevron_right, size: 30, color: Colors.black87)
                ],
              ))
        ],
      ),
    );
  }
}
