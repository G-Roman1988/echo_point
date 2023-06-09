import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';


class DataReader {
  List<String> listOfOptions =[];
  Map<String, dynamic> _data = {};
  Future<void> loadData() async {
    try {
      String jsonData = await rootBundle.loadString('assets/data.json');
      _data = await json.decode(jsonData);
    } catch (error) {
print('eroare la citire sau decodare a fișierului: $error');
    }
  }
List<String> getDropdownOptions (){
  List<String> categoryNames = [];
if (_data.containsKey('Categories')) {
for (var category in _data['Categories']) {
  if (category.containsKey('name')) {
    categoryNames.add(category['name']);
  }
}
}
return categoryNames;
}


}