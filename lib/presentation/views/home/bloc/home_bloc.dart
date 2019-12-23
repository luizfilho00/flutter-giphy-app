import 'dart:async';
import 'package:mymovies/domain/boundary/gif_repository.dart';
import 'package:mymovies/domain/entity/gif.dart';
import 'package:mymovies/presentation/graph/injector.dart';

class HomeBloc {
  Sink<String> get inputSearch => _searchStream.sink;
  Stream<List<Gif>> get gifs => _gifs.stream;

  StreamController<List<Gif>> _gifs = StreamController.broadcast();
  StreamController<String> _searchStream = StreamController.broadcast();
  GifRepository _repository = Injector.inject<GifRepository>();

  HomeBloc() {
    _repository.loadTrendingGifs().then(_loadGifs);
    _searchStream.stream.listen(_onText);
  }

  _loadGifs(List<Gif> gifs) {
    _gifs.add(gifs);
  }

  void _onText(String text) async {
    if (text.trim().isEmpty)
      _gifs.add(await _repository.loadTrendingGifs());
    else
      _gifs.add(await _repository.searchGifs(text));
  }

  void dispose() {
    _gifs.close();
    _searchStream.close();
  }
}
