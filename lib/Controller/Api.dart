import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

List usersList=[];
fetchData() async {
  const url = "https://jsonplaceholder.typicode.com/users";
  try {
    Response response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      usersList=body;
      print(body);
      return body;
      }

  } catch (e) {
    if (kDebugMode) {
      print("error is $e");
    }
  }
}
