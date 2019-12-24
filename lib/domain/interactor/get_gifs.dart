import 'package:mymovies/domain/boundary/gif_repository.dart';
import 'package:mymovies/domain/entity/gif.dart';
import 'package:mymovies/presentation/graph/injector.dart';

class GetGifs {
  final GifRepository repository = Injector.inject<GifRepository>();

  Future<List<Gif>> trending() => repository.loadTrendingGifs();
  Future<List<Gif>> search(String text) => repository.searchGifs(text);
}
