import 'dart:async';

import 'package:mymovies/presentation/utils/async_data.dart';

abstract class BaseBloc {
  void launchDataLoad<T>(StreamController stream, Function function) async {
    stream.add(AsyncData<T>.loading());
    try {
      stream.add(AsyncData<T>.completed(await function()));
    } catch (e) {
      stream.add(AsyncData<T>.error(e.toString()));
    }
  }

  void dispose();
}
