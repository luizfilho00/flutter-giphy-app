import 'dart:async';

import 'package:mymovies/domain/entity/gif.dart';
import 'package:mymovies/domain/interactor/get_gifs.dart';
import 'package:mymovies/presentation/base/base_bloc.dart';
import 'package:mymovies/presentation/utils/async_data.dart';
import 'package:mymovies/presentation/views/home/events/text_event.dart';

class HomeBloc extends BaseBloc {
  Sink<TextEvent> get inputSearch => _searchStream.sink;

  Stream<AsyncData<List<Gif>>> get gifs => _gifs.stream;

  StreamController<AsyncData<List<Gif>>> _gifs = StreamController.broadcast();
  StreamController<TextEvent> _searchStream = StreamController.broadcast();
  GetGifs _getGifs = GetGifs();

  HomeBloc() {
    _searchStream.stream.listen(_handleEvents);
    loadTrendingGifs();
  }

  void loadTrendingGifs() =>
      launchDataLoad<List<Gif>>(_gifs, _getGifs.trending);

  void _handleEvents(TextEvent event) async {
    if (event is SubmitEvent) {
      if (event.text.trim().isEmpty)
        launchDataLoad<List<Gif>>(_gifs, _getGifs.trending);
      else
        launchDataLoad<List<Gif>>(_gifs, () => _getGifs.search(event.text));
    }
  }

  @override
  void dispose() {
    _gifs.close();
    _searchStream.close();
  }
}
