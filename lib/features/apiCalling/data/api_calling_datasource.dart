import 'dart:convert';

import 'package:cartoontv/features/apiCalling/models/user_response_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiCallingDatasource {

  Future<UserResponseModel?> getApiList() async {
    try {
      String url = 'https://gorest.co.in/public-api/users';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        return UserResponseModel.fromJson(jsonResponse);
      } else {
        debugPrint('Failed with status: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error fetching user list: $e');
    }
    return null;
  }
}