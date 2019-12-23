import 'package:dio/dio.dart';
import 'package:mymovies/data/entity/api_gif_response.dart';

class ApiClient {
  final Dio dio;
  final String apiKey;

  ApiClient(this.dio, this.apiKey);

  Future<ApiGifResponse> getGifs() async {
    Response response = await dio.get("trending",
        queryParameters: {"api_key": apiKey, "limit": 100, "rating": "G"});
    return ApiGifResponse.fromJson(response.data);
  }

  Future<ApiGifResponse> searchGifs(String text) async {
    Response response = await dio.get("search", queryParameters: {
      "q": text,
      "api_key": apiKey,
      "limit": 100,
      "rating": "G",
      "lang": "en"
    });
    return ApiGifResponse.fromJson(response.data);
  }
}
