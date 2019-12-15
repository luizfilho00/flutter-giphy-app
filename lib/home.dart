import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:transparent_image/transparent_image.dart';

import 'api.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  Api api = Api();
  String appBarImgUrl =
      "https://developers.giphy.com/static/img/dev-logo-lg.7404c00322a8.gif";
  String _search = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Image.network(appBarImgUrl),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                  labelText: "Pesquise aqui",
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder()),
              style: TextStyle(color: Colors.white, fontSize: 18.0),
              onSubmitted: (text) {
                setState(() {
                  _search = text;
                });
              },
            ),
            Divider(),
            Expanded(
              child: FutureBuilder(
                future:
                    _search.isEmpty ? api.getGifs() : api.searchGifs(_search),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return Container(
                        width: 200.0,
                        height: 200.0,
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                            strokeWidth: 5.0),
                      );
                    default:
                      if (snapshot.hasError)
                        return Container();
                      else
                        return _createGrid(context, snapshot);
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _createGrid(context, snapshot) {
    return GridView.builder(
      padding: EdgeInsets.all(16.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 8.0, crossAxisSpacing: 8.0, crossAxisCount: 2),
      itemCount: snapshot.data["data"].length,
      itemBuilder: (context, index) {
        return FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: snapshot.data["data"][index]["images"]["fixed_height"]["url"],
            height: 300.0,
            fit: BoxFit.cover);
      },
    );
  }
}
