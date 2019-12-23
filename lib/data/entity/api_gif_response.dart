import 'package:mymovies/data/entity/api_data.dart';
import 'package:mymovies/domain/entity/gif.dart';

class ApiGifResponse {
  List<ApiData> data;

  ApiGifResponse({this.data});

  ApiGifResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<ApiData>();
      json['data'].forEach((v) {
        data.add(new ApiData.fromJson(v));
      });
    }
  }

  List<Gif> toGifList() => data
      .map((data) =>
          Gif(data.image.apiFixedHeight.url, data.image.apiOriginalSize.url))
      .toList();
}
