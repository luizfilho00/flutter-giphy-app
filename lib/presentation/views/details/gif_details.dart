import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mymovies/domain/entity/gif.dart';
import 'package:share/share.dart';

class GifDetails extends StatelessWidget {
  final Gif gif;

  GifDetails(this.gif);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("Compartilhar GIF"),
          backgroundColor: Colors.black,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.share),
                onPressed: () => Share.share(gif.originalSizeUrl))
          ],
        ),
        body: Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
                child: CachedNetworkImage(
              imageUrl: gif.originalSizeUrl,
              placeholder: (context, url) => CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ))));
  }
}
