import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cbnu_restaurant/screens/ing_ing.dart';
import 'package:cbnu_restaurant/store/store.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

class MyCup extends StatefulWidget {
  const MyCup({Key? key}) : super(key: key);

  @override
  _MyCupState createState() => _MyCupState();
}

class _MyCupState extends State<MyCup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade100,
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.indigo,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(600),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(300),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('오늘도 좋은태도!',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.indigo.shade100,
                      backgroundImage: AssetImage('assets/ga.png'),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, top: 10),
                child: Text(
                    context.read<Store>().isLogin
                        ? context.watch<Store>().name
                        : "회원가입해라",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    )),
              ),
              SizedBox(
                height: 200,
              ),
              Text("사용중인 컵")
            ],
          ),
        ),
      ),
      body: context.read<Store>().isLogin
          ? ListView.builder(
              itemCount: 20,
              itemBuilder: (context, i) {
                return Panel();
              })
          : Center(child: Image.asset("assets/ga.png")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(Ing());
        },
        child: Icon(Icons.airline_seat_individual_suite_outlined),
      ),
    );
  }
}

class Panel extends StatelessWidget {
  const Panel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      margin: EdgeInsetsDirectional.only(top: 20, end: 60, start: 60),
      decoration: BoxDecoration(
          color: Colors.indigo.shade50,
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [Icon(Icons.local_bar), Text("2022-01-14일까지")],
      ),
    );
  }
}
