import 'package:cbnu_restaurant/widgets/Signboard.dart';
import 'package:cbnu_restaurant/widgets/circlebutton.dart';
import 'package:flutter/material.dart';

Widget panel(ScrollController sc ,context) {
  return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: CustomScrollView(
        controller: sc,
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 30,
                      height: 5,
                      decoration: BoxDecoration(
                          color: Colors.redAccent.shade100,
                          borderRadius:
                          BorderRadius.all(Radius.circular(12.0))),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(),
                SizedBox(
                  height: 18.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[Text('맛집 카테고리')],
                ),
                SizedBox(
                  height: 24.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    button("검색", Icons.search, Colors.blue),
                    button("찜", Icons.favorite, Colors.red),
                    button("맛집건의", Icons.volunteer_activism, Colors.amber),
                    button("광고보기", Icons.ad_units, Colors.green),
                  ],
                ),
                SizedBox(
                  height: 24.0,
                ),
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                      (context, index) => rest(),
                  childCount: 7,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10)),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Divider(),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          )
        ],
      ));
}