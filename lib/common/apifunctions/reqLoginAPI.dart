import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_front/welcome.dart';
import 'package:flutter_front/common/functions/showDialogSingleButton.dart';
import 'dart:convert';
import 'package:flutter_front/services.dart';

import 'package:flutter_front/models/json/loginModel.dart';

Future<LoginModel> reqLoginAPI(BuildContext context,
    String username, String password) async {
  final base_url = ApiSettings.GetApiEndpoint();
  
  Map<String, String> body = {
    'username' : username,
    'password' : password
  };

  final response = await http.post(
    base_url + 'login',
    headers: {'Content-Type' : "application/json"},
    body: json.encode(body)
  );

  print(response.statusCode);
  if (response.statusCode == 200){
    final responseJson = json.decode(response.body);
    var user = new LoginModel.fromJson(responseJson);
    
    Navigator.of(context).pushNamed('/welcome');

    return LoginModel.fromJson(responseJson);
  } else {
    final responseJson = json.decode(response.body);

    showDialogSingleButton(context, "Login Failed", "Login Failed.", "Ok");
  }
}