import 'package:dio/dio.dart';
import 'package:mymovies/data/entity/api_gif_response.dart';

class ApiClient {
  final Dio _apiClient = Dio();
  final apiKey = "RBuHVONIgAuw98Ew1x7NDfRGTtNIe6LS";
  final apiBaseUrl = "https://api.giphy.com/v1/gifs/";

  ApiClient() {
    _apiClient.options.baseUrl = apiBaseUrl;
  }

  Future<ApiGifResponse> getGifs() async {
    Response response = await _apiClient.get("trending",
        queryParameters: {"api_key": apiKey, "limit": 26, "rating": "G"});
    return ApiGifResponse.fromJson(response.data);
  }

  Future<ApiGifResponse> searchGifs(String text) async {
    Response response = await _apiClient.get("search", queryParameters: {
      "q": text,
      "api_key": apiKey,
      "limit": 26,
      "rating": "G",
      "lang": "en"
    });
    return ApiGifResponse.fromJson(response.data);
  }
}
