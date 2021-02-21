import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApplicationRepo with ChangeNotifier {
  var numberList;
  getNumbers(context, apiLink) {
    http.get(
      apiLink,
      headers: {
        'Accept': 'Application/json',
        'Content-Type': 'Application/json'
      },
    ).then((value) {
      var incomingData = json.decode(value.body);
      print(incomingData);
      if (incomingData['Status'] == true) {
        numberList = incomingData['Numbers'];
      }
      notifyListeners();
    });
  }
}
