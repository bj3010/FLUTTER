import 'dart:convert';

import 'package:http/http.dart' as http;

class methodfile {
  Future<List> getuser() async {
    var res = await http
        .get(Uri.parse("https://6503e2fdc8869921ae243d06.mockapi.io/person"));
    print(res);
    return jsonDecode(res.body);
  }

  Future<void> deleteuser(String id) async {
    var res = await http.delete(
        Uri.parse("https://6503e2fdc8869921ae243d06.mockapi.io/person/$id"));
  }

  Future<void> insertuser(Map<String, dynamic> map) async {
    var res = await http.post(
        Uri.parse("https://6503e2fdc8869921ae243d06.mockapi.io/person"),
        body: map);
  }
  Future<void> updateuser(Map<String, dynamic> map,String id) async {
    var res = await http.put(
        Uri.parse("https://6503e2fdc8869921ae243d06.mockapi.io/person/$id"),
        body: map);
  }

}
