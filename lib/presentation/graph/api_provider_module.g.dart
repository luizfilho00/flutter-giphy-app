// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_provider_module.dart';

// **************************************************************************
// InjectorGenerator
// **************************************************************************

class _$ApiProviderModule extends ApiProviderModule {
  void _provideApiClient() {
    final Container container = Container();
    container.registerSingleton(
        (c) => ApiClient(c<Dio>('NAMED_API_GIFS'), c<String>()));
  }
}
