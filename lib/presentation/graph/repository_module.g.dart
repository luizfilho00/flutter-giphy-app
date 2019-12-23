// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_module.dart';

// **************************************************************************
// InjectorGenerator
// **************************************************************************

class _$RepositoryModule extends RepositoryModule {
  void _configure() {
    final Container container = Container();
    container.registerFactory<GifRepository, DefaultGifRepository>(
        (c) => DefaultGifRepository(c<ApiClient>()));
    container.registerFactory<FakeRepository, DefaultFakeRepository>(
        (c) => DefaultFakeRepository(c<ApiClient>()));
  }
}
