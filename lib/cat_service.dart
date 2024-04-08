import 'dart:convert';

import 'package:http/http.dart' as http;

class CatService {
  Future<List<dynamic>> getCats() async {
    var cats = await http
        .get(Uri.parse('https://api.thecatapi.com/v1/images/search?limit=10'));
    List<dynamic> catsResponse = json.decode(cats.body);
    return catsResponse;
  }
}
