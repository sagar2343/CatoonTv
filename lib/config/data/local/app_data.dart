import 'dart:convert';

import '../../constants/sp_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';



class AppData {
  static AppData _instance = AppData._internal();

  factory AppData() {
    return _instance;
  }

  AppData._internal();

  String? _savedEmail;
  String? _savedPassword;
  // LoginResponse? _loginResponse;


  // void setLoginResponse(LoginResponse? loginResponse) {
  //   _loginResponse = loginResponse;
  //   _saveThisInstance();
  // }

  // LoginResponse? getLoginResponse() {
  //   return _loginResponse;
  // }

  void setSavedEmail(String? mobile) {
    _savedEmail = mobile;
    _saveThisInstance();
  }

  String? getSavedEmail() {
    return _savedEmail;
  }

  void setSavedPassword(String? password) {
    _savedPassword = password;
    _saveThisInstance();
  }

  String? getSavedPassword() {
    return _savedPassword;
  }

  Future<void> clearAll() async {
    final sharedPreference = await SharedPreferences.getInstance();
    await sharedPreference.clear();
    _savedEmail = null;
    _savedPassword = null;
    // _loginResponse = null;
  }

  void _saveThisInstance() async {
    final sharedPreference = await SharedPreferences.getInstance();
    sharedPreference.setString(
      SPConstants.appData.name,
      json.encode(AppData().toJson()),
    );
  }

  Future<void> restoreInstance() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString(SPConstants.appData.name) != null) {
      _instance = AppData.fromJson(
        json.decode(
          prefs.getString(SPConstants.appData.name)!,
        ),
      );
    }
  }

  AppData.fromJson(Map<String, dynamic> json) {
    // _loginResponse = json['loginResponse'] != null
    //     ? LoginResponse.fromJson(json['loginResponse'])
    //     : null;
    _savedEmail = json['SavedMobile'];
    _savedPassword = json['SavedPassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['SavedMobile'] = _savedEmail;
    data['SavedPassword'] = _savedPassword;
    // data['loginResponse'] = _loginResponse!.toJson();
    return data;
  }
}
