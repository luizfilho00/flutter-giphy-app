import 'package:mymovies/domain/entity/gif.dart';

abstract class GifRepository {
  Future<List<Gif>> loadTrendingGifs();
  Future<List<Gif>> searchGifs(String text);
}
