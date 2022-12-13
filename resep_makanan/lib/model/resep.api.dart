import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:resep_makanan/model/resep.dart';

class ResepApi {
  static Future<List<Resep>> getResep() async {
    var uri = Uri.https('tasty.p.rapidapi.com', '/recipes/list',
        {"from": "0", "size": "50", "tags": "under_30_minutes"});

    final response = await http.get(uri, headers: {
      "x-rapidapi-key": "f4d59d37bbmsheb5fe9f3e90a140p118a60jsnf45a0e6e46f1",
      "x-rapidapi-host": "tasty.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['results']) {
      _temp.add(i);
    }

    return Resep.resepFromSnapshot(_temp);
  }
}
