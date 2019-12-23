import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mymovies/domain/entity/gif.dart';
import 'package:mymovies/presentation/base/base_stateful_state.dart';
import 'package:mymovies/presentation/utils/api_response.dart';
import 'package:mymovies/presentation/views/home/bloc/home_bloc.dart';
import 'package:mymovies/presentation/views/home/events/text_event.dart';
import 'package:transparent_image/transparent_image.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends BaseState {
  String appBarImgUrl =
      "https://developers.giphy.com/static/img/dev-logo-lg.7404c00322a8.gif";
  HomeBloc _homeBloc;

  _HomePageState() {
    _homeBloc = HomeBloc();
    super.blocs = [_homeBloc];
  }

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
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white))),
              style: TextStyle(color: Colors.white, fontSize: 18.0),
              cursorColor: Colors.white,
              onSubmitted: (text) =>
                  _homeBloc.inputSearch.add(SubmitEvent(text)),
            ),
            Divider(),
            Expanded(
              child: StreamBuilder<ApiResponse>(
                stream: _homeBloc.gifs,
                builder: (context, snapshot) {
                  if (snapshot.hasData)
                    switch (snapshot.data.status) {
                      case Status.LOADING:
                        return Container(
                          width: 200.0,
                          height: 200.0,
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                              strokeWidth: 5.0),
                        );
                      case Status.COMPLETED:
                        return _createGrid(context, snapshot.data.data);
                      case Status.ERROR:
                        return Center(
                          child: Text(
                            snapshot.data.message,
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.white),
                          ),
                        );
                    }
                  return Container();
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _createGrid(BuildContext context, List<Gif> gifs) {
    if (gifs.isEmpty)
      return Center(
          child: Text("Nenhum gif encontrado :(",
              style: TextStyle(color: Colors.white, fontSize: 18.0)));
    else
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
}
