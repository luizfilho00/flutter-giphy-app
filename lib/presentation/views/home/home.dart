import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mymovies/domain/entity/gif.dart';
import 'package:mymovies/presentation/views/home/bloc/home_bloc.dart';
import 'package:transparent_image/transparent_image.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  String appBarImgUrl =
      "https://developers.giphy.com/static/img/dev-logo-lg.7404c00322a8.gif";
  HomeBloc _homeBloc = HomeBloc();

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
              onSubmitted: (text) => _homeBloc.inputSearch.add(text),
            ),
            Divider(),
            Expanded(
              child: StreamBuilder(
                stream: _homeBloc.gifs,
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
                        return Center(
                          child: Text(
                            "Nennhuma imagem disponível :(",
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.white),
                          ),
                        );
                      else
                        return _createGrid(context, snapshot.data);
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _createGrid(BuildContext context, List<Gif> gifs) {
    return GridView.builder(
      padding: EdgeInsets.all(16.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 8.0, crossAxisSpacing: 8.0, crossAxisCount: 2),
      itemCount: gifs.length,
      itemBuilder: (context, index) {
        return FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: gifs[index].url,
            height: 300.0,
            fit: BoxFit.cover);
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _homeBloc.dispose();
  }
}
