class ApiFixedHeight {
  String height;
  String mp4;
  String mp4Size;
  String size;
  String url;
  String webp;
  String webpSize;
  String width;

  ApiFixedHeight(
      {this.height,
      this.mp4,
      this.mp4Size,
      this.size,
      this.url,
      this.webp,
      this.webpSize,
      this.width});

  ApiFixedHeight.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    mp4 = json['mp4'];
    mp4Size = json['mp4_size'];
    size = json['size'];
    url = json['url'];
    webp = json['webp'];
    webpSize = json['webp_size'];
    width = json['width'];
  }
}
