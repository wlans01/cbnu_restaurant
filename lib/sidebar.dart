import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:cbnu_restaurant/store/store.dart';
import 'package:cbnu_restaurant/screens/ing_ing.dart';
import 'package:cbnu_restaurant/screens/setting.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.indigo.shade100,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      context.read<Store>().isLogin
                          ? Text("안녕하세요 \n${context.watch<Store>().name}님",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                          ))
                          : Text('로그인후 이용해주세요',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                          )),
                    ],
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.question_answer_outlined),
                  title: Text("문의하기"),
                  onTap: () {
                    print(context.read<Store>().allR[1][0].title);
                  },
                ),
                ListTile(
                    leading: Icon(Icons.settings),
                    title: Text("환경설정"),
                    onTap: () {
                      Get.to(() => Setting());
                    }),
                ListTile(
                  leading: Icon(Icons.logout_outlined),
                  title: Text("로그아웃 (임시용)"),
                  onTap: () {
                    context.read<Store>().currentLogin(false);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.login_outlined),
                  title: Text("로그인 (임시용)"),
                  onTap: () {
                    context.read<Store>().currentLogin(true);
                  },
                ),
              ],
            ),
          ),
          ListTile(
            title: Text("Good Attitude"),
            trailing: Image.asset("assets/ga.png"),
          )
        ],
      ),
    );
  }
}