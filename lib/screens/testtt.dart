import 'package:flutter/material.dart';

class Testtt extends StatefulWidget {
  const Testtt({Key? key}) : super(key: key);

  @override
  _TestttState createState() => _TestttState();
}

class _TestttState extends State<Testtt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2 ,crossAxisSpacing: 10,mainAxisSpacing: 10),
          itemCount: 5,
          padding: const EdgeInsets.only(left: 12,right: 12),

          itemBuilder: (c, i) {
            return Container(
              color: Colors.grey,
              child: Center(child: Text('wdw')),
            );
          }),
    );
  }
}
