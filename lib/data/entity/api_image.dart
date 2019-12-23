import 'package:mymovies/data/entity/api_fixed_height.dart';
import 'package:mymovies/data/entity/api_original_size.dart';

class ApiImage {
  ApiFixedHeight apiFixedHeight;
  ApiOriginalSize apiOriginalSize;

  ApiImage({this.apiFixedHeight, this.apiOriginalSize});

  ApiImage.fromJson(Map<String, dynamic> json) {
    apiFixedHeight = json['fixed_height'] != null
        ? new ApiFixedHeight.fromJson(json['fixed_height'])
        : null;
    apiOriginalSize = json['original'] != null
        ? new ApiOriginalSize.fromJson(json['original'])
        : null;
  }
}
