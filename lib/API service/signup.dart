import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/data_model.dart';

class APIservice {
  static Future<http.Response> postData(
      String name, String email, String phone, String address) async {
    var url = 'http://developers.gictsystems.com/api/dummy/submit/';
    var res = await http.post(Uri.parse(url),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8"
        },
        body: jsonEncode(<String, dynamic>{
          "fullnames": name,
          "email": email,
          "phone": phone,
          "address": address
        }));

    return res;
  }

  static Future<List<User>> getData() async {
    var url = 'http://developers.gictsystems.com/api/dummy/items/';
    var res = await http.get(Uri.parse(url), headers: <String, String>{
      "Content-Type": "application/json; charset=UTF-8",
      "Authorization": "Bearer ALDJAK23423JKSLAJAF23423J23SAD3"
    });

    if (res.statusCode == 200) {
      List jsonResponse = jsonDecode(res.body);
      return jsonResponse.map((data) => User.fromJson(data)).toList();
    } else {
      throw Exception("Error");
    }
  }
}
