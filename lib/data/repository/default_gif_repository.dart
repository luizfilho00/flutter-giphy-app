import 'package:mymovies/data/remote/api_client.dart';
import 'package:mymovies/domain/boundary/gif_repository.dart';
import 'package:mymovies/domain/entity/gif.dart';

class DefaultGifRepository extends GifRepository {
  ApiClient _api;

  DefaultGifRepository(this._api);

  Future<List<Gif>> loadTrendingGifs() async {
    return await _api.getGifs().then((apiGif) => apiGif.toGifList());
  }

  Future<List<Gif>> searchGifs(String text) async {
    return await _api.searchGifs(text).then((apiGif) => apiGif.toGifList());
  }
}
