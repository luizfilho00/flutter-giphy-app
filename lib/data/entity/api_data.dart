import 'package:mymovies/data/entity/api_image.dart';

class ApiData {
  ApiImage image;

  ApiData({this.image});

  ApiData.fromJson(Map<String, dynamic> json) {
    image =
        json['images'] != null ? new ApiImage.fromJson(json['images']) : null;
  }
}
