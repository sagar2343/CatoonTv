import 'package:cartoontv/features/apiCalling/data/api_calling_datasource.dart';
import 'package:cartoontv/features/apiCalling/models/user_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ApiCallingController {
  final BuildContext context;
  final VoidCallback reloadData;

  List<User> userList = [];

  ApiCallingController ({required this.context, required this.reloadData});

  void init() async {
    EasyLoading.show(status: 'Loading...');
    final response = await ApiCallingDatasource().getApiList();
    EasyLoading.dismiss();
    if (response == null) {
      EasyLoading.showInfo('Something went wrong');
      return;
    }
    if (response.code == 200) {
      userList = response.data ?? [];
      reloadData();
    } else {
      EasyLoading.showInfo("Failed to get Data ${response.code}");
    }
  }

}