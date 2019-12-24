import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mymovies/domain/entity/gif.dart';
import 'package:mymovies/presentation/base/base_stateful_state.dart';
import 'package:mymovies/presentation/views/details/gif_details.dart';
import 'package:mymovies/presentation/views/home/bloc/home_bloc.dart';
import 'package:mymovies/presentation/views/home/events/text_event.dart';
import 'package:mymovies/presentation/views/shared/styles/input_text_styles.dart';
import 'package:mymovies/presentation/views/shared/widgets/default_stream_builder.dart';
import 'package:mymovies/presentation/views/shared/widgets/material_input_text.dart';
import 'package:mymovies/presentation/views/shared/widgets/text_not_found_gifs.dart';
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
            MaterialInputText(
              hint: "Buscar GIFs",
              onSubmitted: (text) => _homeBloc.inputSearch.add(SubmitEvent(text)),
              style: WhiteTextSize18(),
            ),
            Divider(),
            Expanded(
              child: DefaultStreamBuilder(
                _homeBloc.gifs,
                successAction: _createGrid,
                defaultEmptyPlaceholder: TextNotFoundGifs(),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _createGrid(BuildContext context, List<Gif> gifs) {
    if (gifs.isEmpty)
      return TextNotFoundGifs();
    else
      return GridView.builder(
        padding: EdgeInsets.all(16.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 8.0, crossAxisSpacing: 8.0, crossAxisCount: 2),
        itemCount: gifs.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => GifDetails(gifs[index]))),
            child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: gifs[index].url,
                height: 300.0,
                fit: BoxFit.cover),
          );
        },
      );
  }
}
