import 'package:flutter/material.dart';

class DetailsPageText {
 
  Widget getDetailsPageText(
      final text, final textHeading, final Color textColor) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey.shade500,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            textHeading,
            style: TextStyle(
                color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
          ),
          Text(
            ' $text',
            style: TextStyle(color: textColor, fontSize: 13),
          ),
        ],
      ),
    );
  }
}
