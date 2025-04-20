import 'dart:convert';

import 'package:cartoontv/features/form/model/form_sunmit_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

class FormDatasource{

  String token = 'd26d956477e9b8ad7fe552a1732a4d5a10a12d5c07dc8b82d7d4b43021b62d3b';

  Future<UserModel?> submitForm(String name, String email, String gender) async {
    try {
      String url = 'https://gorest.co.in/public/v2/users';
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "name": name,
          "email": email,
          "gender": gender,
          "status": "active"
        }),
      );

      if (response.statusCode == 201) {
        debugPrint(response.body);
        return UserModel.fromJson(jsonDecode(response.body));
      } else {
        EasyLoading.showInfo(response.body);
      }
    } catch (e) {
      debugPrint('Error Submitting form: $e');
    }
    return null;
  }

}