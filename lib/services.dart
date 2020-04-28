import 'package:flutter/foundation.dart';

class ApiSettings {

  static String GetApiEndpoint() {
    //print("kRelaseMode is [" + kReleaseMode.toString() + "]");
    //if (kReleaseMode) {
      return 'https://eu-vs-covid.herokuapp.com/api/';
    //} else {
      return 'http://127.0.0.1:5000/api/';
    //}
  }
}


