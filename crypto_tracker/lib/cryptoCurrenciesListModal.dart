import 'package:crypto_tracker/cryptoApi.dart';
import 'package:flutter/material.dart';

List<DataTile> dataTileLists = [
  DataTile(nameIndex: 1),
  DataTile(nameIndex: 2),
  DataTile(nameIndex: 3),
  DataTile(nameIndex: 4),
  DataTile(nameIndex: 5),
  DataTile(nameIndex: 6),
  DataTile(nameIndex: 7),
  DataTile(nameIndex: 8),
  DataTile(nameIndex: 9),
  DataTile(nameIndex: 10),
];

class DataTile {
  DataTile({required this.nameIndex});
  final int nameIndex;
  
}
