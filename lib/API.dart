import 'dart:async';
import 'package:http/http.dart' as http;

class API {
  static Future getUsers(String url) {
    return  http.get(
      //Uri.encodeFull removes all the dashes or extra characters present in our Uri
        Uri.encodeFull(url),
        headers: {
          "Accept": "application/json"
        });
  }
}