import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget rest(data) {
  return GestureDetector(
    onTap: (){},
    child: Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.deepOrange.shade50,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  data.snippet,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "5.0",
                    style: TextStyle(color: Colors.redAccent),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 15,
                        color: Colors.redAccent,
                      ),
                      Icon(
                        Icons.star,
                        size: 15,
                        color: Colors.redAccent,
                      ),
                      Icon(
                        Icons.star,
                        size: 15,
                        color: Colors.redAccent,
                      ),
                      Icon(
                        Icons.star,
                        size: 15,
                        color: Colors.redAccent,
                      ),
                      Icon(
                        Icons.star,
                        size: 15,
                        color: Colors.redAccent,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text("(26)")
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(data.holiday,overflow: TextOverflow.ellipsis,maxLines: 1,),
              SizedBox(
                height: 5,
              ),
              Text(data.phienumber)
            ],
          )
        ],
      ),
    ),
  );
}