import 'dart:async';
import 'package:mymovies/domain/boundary/gif_repository.dart';
import 'package:mymovies/domain/entity/gif.dart';
import 'package:mymovies/presentation/graph/injector.dart';
import 'package:mymovies/presentation/utils/api_response.dart';
import 'package:mymovies/presentation/views/home/events/text_event.dart';

class HomeBloc {
  Sink<TextEvent> get inputSearch => _searchStream.sink;
  Stream<ApiResponse<List<Gif>>> get gifs => _gifs.stream;

  StreamController<ApiResponse<List<Gif>>> _gifs = StreamController.broadcast();
  StreamController<TextEvent> _searchStream = StreamController.broadcast();
  GifRepository _repository = Injector.inject<GifRepository>();

  HomeBloc() {
    _searchStream.stream.listen(_handleEvents);
    _fetchTrendingGifs();
  }

  _fetchTrendingGifs() async {
    _gifs.add(ApiResponse.loading());
    try {
      _onGifsReceived(await _repository.loadTrendingGifs());
    } catch (e) {
      _gifs.add(ApiResponse.error(e.toString()));
    }
  }

  _fetchGifsByText(String text) async {
    _gifs.add(ApiResponse.loading());
    try {
      _onGifsReceived(await _repository.searchGifs(text));
    } catch (e) {
      _gifs.add(ApiResponse.error(e.toString()));
    }
  }

  void _onGifsReceived(List<Gif> gifs) {
    _gifs.add(ApiResponse.completed(gifs));
  }

  void _handleEvents(TextEvent event) async {
    if (event is SubmitEvent) {
      if (event.text.trim().isEmpty)
        _fetchTrendingGifs();
      else
        _fetchGifsByText(event.text);
    }
  }

  void dispose() {
    _gifs.close();
    _searchStream.close();
  }
}
