import 'package:flutter/material.dart';
import 'package:get/get.dart';

RxList<Map<String, dynamic>> listShopOption = <Map<String, dynamic>>[
  {
    'title': 'Display Products',
    'image': 'assets/icons/shopping-online.png',
    'backgroundColor': Colors.pink[50],
    'page': 'display'
  },
  {
    'title': 'Add Products',
    'image': 'assets/icons/management.png',
    'backgroundColor': Colors.green[100],
    'page': 'add'
  },
  {
    'title': 'Edit Products',
    'image': 'assets/icons/management.png',
    'backgroundColor': Colors.amber[50],
    'page': 'edit'
  }
].obs;
