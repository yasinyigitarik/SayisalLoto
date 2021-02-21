import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApplicationRepo with ChangeNotifier {
  getNumbers(context) {
    http.get(
      'https://localhost:44330/RandomNumber',
      headers: {
        'Accept': 'Application/json',
        'Content-Type': 'Application/json'
      },
    ).then((value) {
      var incomingData = json.decode(value.body);
      print(incomingData);
      notifyListeners();
    });
  }
}
