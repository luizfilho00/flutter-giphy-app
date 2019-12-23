import 'package:kiwi/kiwi.dart';
import 'package:mymovies/presentation/graph/api_provider_module.dart';
import 'package:mymovies/presentation/graph/repository_module.dart';

abstract class Injector {
  static Container container;

  static final inject = container.resolve;

  static void setup() {
    container = Container();
    ApiProviderModule.setup();
    RepositoryModule.setup();
  }
}
