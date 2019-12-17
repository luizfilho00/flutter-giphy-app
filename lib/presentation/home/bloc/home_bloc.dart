import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:mymovies/domain/boundary/gif_repository.dart';
import 'package:mymovies/domain/entity/gif.dart';

class HomeBloc extends BlocBase {
  Sink<String> get inputSearch => _searchStream.sink;
  Stream<List<Gif>> get gifsUrl => _gifsUrl.stream;

  StreamController<List<Gif>> _gifsUrl = StreamController.broadcast();
  StreamController<String> _searchStream = StreamController.broadcast();
  GifRepository _repository;

  HomeBloc(this._repository) {
    _repository.loadTrendingGifs().then(_loadGifs);
    _searchStream.stream.listen(_onText);
  }

  _loadGifs(List<Gif> gifs) {
    _gifsUrl.add(gifs);
  }

  void _onText(String text) async {
    if (text.trim().isEmpty)
      _gifsUrl.add(await _repository.loadTrendingGifs());
    else
      _gifsUrl.add(await _repository.searchGifs(text));
  }

  @override
  void dispose() {
    _gifsUrl.close();
    _searchStream.close();
    super.dispose();
  }
}
