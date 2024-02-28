import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EventProvider extends ChangeNotifier {
  Future<dynamic> loadJson() async {
    String jsonString = await rootBundle.loadString('assets/events_data.json');
    List<Map<String, dynamic>> data = jsonDecode(jsonString);
    return data;
  }

  List<Map<String, dynamic>> bookList = [];
  List<Map<String, dynamic>> foundBooks = [];

  void init() async {
    bookList = await loadJson();
    foundBooks = bookList;
    print(bookList);
  }

  List<Map<String, dynamic>> get events => bookList;
  String _searchString = "";

  void changeSearchAndFilterString2(String searchString) {
    _searchString = searchString;
    notifyListeners();
  }

  void runFilter(String category) {
    List<Map<String, dynamic>> results = [];
    if (category.isEmpty) {
      results = bookList;
    } else {
      results = bookList
          .where((book) => book['eventReadStatus']
              .toLowerCase()
              .toString()
              .contains(category.toLowerCase()))
          .toList();
    }

    foundBooks = results;
    notifyListeners();
  }
}
