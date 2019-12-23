import 'dart:async';
import 'package:mymovies/domain/boundary/gif_repository.dart';
import 'package:mymovies/domain/entity/gif.dart';
import 'package:mymovies/presentation/base/base_bloc.dart';
import 'package:mymovies/presentation/graph/injector.dart';
import 'package:mymovies/presentation/utils/api_response.dart';
import 'package:mymovies/presentation/views/home/events/text_event.dart';

class HomeBloc extends BaseBloc {
  Sink<TextEvent> get inputSearch => _searchStream.sink;
  Stream<ApiResponse<List<Gif>>> get gifs => _gifs.stream;

  StreamController<ApiResponse<List<Gif>>> _gifs = StreamController.broadcast();
  StreamController<TextEvent> _searchStream = StreamController.broadcast();
  GifRepository _repository = Injector.inject<GifRepository>();

  HomeBloc() {
    _searchStream.stream.listen(_handleEvents);
    launchDataLoad<List<Gif>>(_gifs, _repository.loadTrendingGifs);
  }

  void _handleEvents(TextEvent event) async {
    if (event is SubmitEvent) {
      if (event.text.trim().isEmpty)
        launchDataLoad<List<Gif>>(_gifs, _repository.loadTrendingGifs);
      else
        launchDataLoad<List<Gif>>(
            _gifs, () => _repository.searchGifs(event.text));
    }
  }

  @override
  void dispose() {
    _gifs.close();
    _searchStream.close();
  }
}
