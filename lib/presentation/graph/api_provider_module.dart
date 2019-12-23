import 'package:dio/dio.dart';
import 'package:kiwi/kiwi.dart';
import 'package:mymovies/data/remote/api_client.dart';
import 'package:mymovies/presentation/graph/injector.dart';

part 'api_provider_module.g.dart';

abstract class ApiProviderModule {
  static Container container;
  static const String NAMED_API_GIFS = "NAMED_API_GIFS";
  static const String API_KEY = "RBuHVONIgAuw98Ew1x7NDfRGTtNIe6LS";
  static const String API_END_POINT = "https://api.giphy.com/v1/gifs/";

  static void setup() {
    container = Injector.container;
    _$ApiProviderModule()._provideDio();
    _$ApiProviderModule()._provideGifApiKey();
    _$ApiProviderModule()._provideApiClient();
  }

  void _provideDio() {
    Dio dio = Dio();
    dio.options.baseUrl = API_END_POINT;
    container.registerInstance(dio, name: NAMED_API_GIFS);
  }

  void _provideGifApiKey() => container.registerInstance(API_KEY);

  @Register.singleton(ApiClient, resolvers: {Dio: NAMED_API_GIFS})
  void _provideApiClient();
}
