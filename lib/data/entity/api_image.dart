import 'package:mymovies/data/entity/api_fixed_height.dart';

class ApiImage {
  ApiFixedHeight apiFixedHeight;

  ApiImage({this.apiFixedHeight});

  ApiImage.fromJson(Map<String, dynamic> json) {
    apiFixedHeight = json['fixed_height'] != null
        ? new ApiFixedHeight.fromJson(json['fixed_height'])
        : null;
  }
}
