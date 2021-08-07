import 'package:flutter/material.dart';

Widget searhBox() {
  return Container(
    padding: EdgeInsets.fromLTRB(20, 2, 0, 0),
    height: 57.5,
    width: 300,
    decoration: BoxDecoration(
        color: Color(0xff262531), borderRadius: BorderRadius.circular(50)),
    child: Row(
      children: [
        Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
            )),
        Expanded(
          flex: 8,
          child: TextFormField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search...",
                hintStyle: TextStyle(color: Color(0xff504F57), fontSize: 15)),
          ),
        ),
      ],
    ),
  );
}
