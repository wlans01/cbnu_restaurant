import 'package:flutter/material.dart';

Widget rest() {
  return Container(
    padding: const EdgeInsets.all(5),
    decoration: BoxDecoration(
      color: Colors.deepOrange.shade50,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                '가게이름은 우리집냉면',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Text('돼지 주물럭, 무쌈냉면', overflow: TextOverflow.ellipsis),
            Row(
              children: [Icon(Icons.favorite,size: 20,), Text('52')],
            )
          ],
        )
      ],
    ),
  );
}