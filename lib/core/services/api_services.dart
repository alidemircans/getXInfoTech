import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiServices {
  var BASEURL = 'https://jsonplaceholder.typicode.com';
  Future getAllPosts() async {
    var url = '$BASEURL/posts';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return false;
    }
  }
}
