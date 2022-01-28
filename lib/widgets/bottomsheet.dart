import 'package:flutter/material.dart';
import 'package:bottom_sheet/bottom_sheet.dart';

void showSheetWithoutList(context,data) {
  showStickyFlexibleBottomSheet<void>(
    minHeight: 0,
    initHeight: 0.2,
    maxHeight: .8,
    headerHeight: 150,
    context: context,
    decoration: const BoxDecoration(
      color: Colors.teal,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10.0),
        topRight: Radius.circular(10.0),
      ),
    ),
    headerBuilder: (context, offset) {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(offset == 0.8 ? 5 : 10),
            topRight: Radius.circular(offset == 0.8 ? 5 : 10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.title,
                          style: TextStyle(fontSize: 30),
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
                      Text(data.holiday),
                      SizedBox(
                        height: 5,
                      ),
                      Text(data.phienumber)
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Icon(Icons.favorite_border),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        side: BorderSide(color: Colors.grey.shade300,width: 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Icon(Icons.question_answer_outlined),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        side: BorderSide(color: Colors.grey.shade300,width: 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    },
    bodyBuilder: (context, offset) {
      return SliverChildListDelegate(
        _children,
      );
    },
    anchors: [.2, 0.5, .8],
  );
}



List<Widget> _children = [
  const _TextField(),
  const _TestContainer(color: Color(0xEEFFFF00)),
  const _TextField(),
  const _TestContainer(color: Color(0xDD99FF00)),
  const _TextField(),
  const _TestContainer(color: Color(0xCC00FFFF)),
  const _TextField(),
  const _TestContainer(color: Color(0xBB555555)),
  const _TextField(),
  const _TestContainer(color: Color(0xAAFF5555)),
  const _TextField(),
  const _TestContainer(color: Color(0x9900FF00)),
  const _TextField(),
  const _TestContainer(color: Color(0x8800FF00)),
  const _TextField(),
  const _TestContainer(color: Color(0x7700FF00)),
  const _TextField(),
];

class _TextField extends StatelessWidget {
  const _TextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Enter a search term',
      ),
    );
  }
}

class _TestContainer extends StatelessWidget {
  final Color color;

  const _TestContainer({
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        color: color,
      ),
    );
  }
}
