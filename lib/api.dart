import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  Future<Map> getGifs() async {
    http.Response response = await http.get(
        "https://api.giphy.com/v1/gifs/random?api_key=RBuHVONIgAuw98Ew1x7NDfRGTtNIe6LS&tag=&rating=G");

    return json.decode(response.body);
  }
}
