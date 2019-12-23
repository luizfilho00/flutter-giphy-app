class ApiOriginalSize {
  String url;

  ApiOriginalSize({this.url});

  ApiOriginalSize.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }
}
