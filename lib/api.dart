import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  final trendingGifsUrl =
      "https://api.giphy.com/v1/gifs/trending?api_key=RBuHVONIgAuw98Ew1x7NDfRGTtNIe6LS&limit=26&rating=G";

  Future<Map> getGifs() async {
    http.Response response = await http.get(trendingGifsUrl);

    return json.decode(response.body);
  }

  Future<Map> searchGifs(String text) async {
    http.Response response = await http.get("https://api.giphy.com/v1/gifs/search?api_key=RBuHVONIgAuw98Ew1x7NDfRGTtNIe6LS&q=$text&limit=26&offset=0&rating=G&lang=en");
    return json.decode(response.body);
  }
}
