import 'package:kiwi/kiwi.dart';
import 'package:mymovies/data/remote/api_client.dart';
import 'package:mymovies/data/repository/default_gif_repository.dart';
import 'package:mymovies/domain/boundary/gif_repository.dart';
import 'package:mymovies/presentation/graph/injector.dart';

part 'repository_module.g.dart';

abstract class RepositoryModule {
  static Container container;

  static void setup() {
    container = Injector.container;
    _$RepositoryModule()._configure();
  }

  @Register.factory(GifRepository, from: DefaultGifRepository)
  void _configure();
}
