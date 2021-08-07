import 'package:flutter/material.dart';

Widget topBar() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 25),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          child: Column(
            children: [
              Text('Market Cap',
                  style: TextStyle(
                      color: Colors.grey.shade500,
                      )),
              Text(
                '\$1.6B',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '7.09\%',
                style: TextStyle(color: Colors.green),
              ),
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Text('Market Cap',
                  style: TextStyle(
                    color: Colors.grey.shade500,
                  )),
              Text(
                '\$1.6B',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '7.09\%',
                style: TextStyle(color: Colors.green),
              ),
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Text('Market Cap',
                  style: TextStyle(
                    color: Colors.grey.shade500,
                  )),
              Text(
                '\$1.6B',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '7.09\%',
                style: TextStyle(color: Colors.green),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
