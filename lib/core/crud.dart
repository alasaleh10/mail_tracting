import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Crud {
  getdata(String uri) async {
    try {
      var response = await http.get(Uri.parse(uri));
      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);

        return responseBody;
      }
    } catch (e) {
      debugPrint('error $e');
    }
  }

  postdata(Map data, String uri) async {
    try {
      var response = await http.post(Uri.parse(uri), body: data);
      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        return responseBody;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
